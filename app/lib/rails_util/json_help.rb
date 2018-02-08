module RailsUtil
  module JsonHelper
    class MissingSerializerError < StandardError; end

    def json_with(resource, **options)
      return json_empty(**options) unless resource
      root_key = resource.class.name.split('::').last.underscore

      return json_error(
        { root_key => map_base_to__error(resource.errors.messages) },
        **options
      ) if errors?(resource)

      return json_success(
        { root_key => {} },
        **options
      ) if destroyed?(resource)

      serialize_json_resource(resource, **options)
    end

    def json_collection(resource, **options)
      return render json: [], **options unless resource.any?
      json_with(resource, **options)
    end

    def json_empty(**options)
      render json: {}, **options
    end

    def json_error(nested_path_or_obj, message=nil, **options)
      error_obj = set_nested_path(nested_path_or_obj, message)
      render(
        json: { errors: error_obj },
        status: :unprocessable_entity,
        **options
      )
    end

    def json_success(path_or_obj, message=nil, **options)
      render(
        json: set_nested_path(path_or_obj, message),
        **options
      )
    end

    def serialize_json_resource(resource, **options)
      serializer_options = options[:serializer_options] || {}
      serializable_resource = ActiveModelSerializers::SerializableResource.new(
        resource,
        serializer_options.merge(scope: serialization_scope)
      )
      raise MissingSerializerError unless serializable_resource.serializer?
      serialized_obj = serializable_resource.serializer_instance.object
      type = options[:resource] || serialized_object_type(serialized_obj)

      data = { type: type, attributes: serializable_resource.serializer_instance }
      data[:additional_data] = options[:additional_data] if options && options[:additional_data]

      render json: { data: data }, **options
    end

    private

    def set_nested_path(nested_path_or_obj, message)
      return set_nested(nested_path_or_obj, message) if nested_path_or_obj.is_a? String
      nested_path_or_obj
    end

    def map_base_to__error(error_obj)
      error_obj[:_error] = error_obj.delete(:base) if error_obj.key? :base
      error_obj
    end

    def errors?(resource)
      resource.respond_to?(:errors) && resource.errors.any?
    end

    def destroyed?(resource)
      resource.respond_to?(:destroyed?) && resource.destroyed?
    end

    def set_nested(path, value, obj={})
      obj.deep_merge(path_to_hash(path, value))
    end

    def serialized_object_type(obj)
      is_multiple = obj.try(:length) && obj.length.positive?
      type = is_multiple ? Util.underscored_class_name(obj.first).pluralize : Util.underscored_class_name(obj)
      type.split('/').first
    end

    def path_to_hash(path, value)
      parts = (path.is_a?(String) ? path.split('.') : path).reverse
      initial = { parts.shift => value }
      parts.reduce(initial) { |a, e| { e => a } }
    end
  end
end
