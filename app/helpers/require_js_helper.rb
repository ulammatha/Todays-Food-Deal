# Helper methods for more easily defining and accessing javascript dependencies
# within our application views.
module RequireJsHelper

  # Generates a requirejs javascript configuration object.
  #
  # The configuration options are stored in config/requirejs.yml. All properties
  # specified within that file must be valid RequireJS configuration options.
  #
  # @note You shouldn't need to call this directly. It'll be included if needed when calling #require_js
  # @see http://requirejs.org/docs/api.html#config RequireJS API: Configuration Options
  def require_js_init
    return @require_js_config if @require_js_init

    @require_js_config  = ""
    @require_js_config << javascript_include_tag("requirejs/require")

    config = File.read( Rails.root.join("config", "requirejs.json") )
    @require_js_config << javascript_tag("require.config(%s);" % config.chomp)

    @require_js_init = true
    @require_js_config.html_safe
  end

  # Use RequireJS to load one or more javascript modules in the order provided.
  #
  # @example Require several javascript modules
  #   require_js("application", "course_list", "notification")
  def require_js(*dependencies)
    @require_js_dependencies ||= []
    @require_js_dependencies += dependencies
    nil
  end

  def flush_require_js_dependencies
    javascript_tag("require(%s)" % Array.wrap(@require_js_dependencies).to_s)
  end

end
