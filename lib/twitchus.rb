# encoding: utf-8

Encoding.default_external = Encoding::UTF_8

require_relative "twitchus/version"
require_relative "twitchus/config"
require_relative "twitchus/cli"
require_relative "twitchus/checker"
require_relative "twitchus/storage"
require_relative "twitchus/worker"

module Twitchus
end
