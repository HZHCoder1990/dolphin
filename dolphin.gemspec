# frozen_string_literal: true

require_relative "lib/dolphin/version"

Gem::Specification.new do |spec|
  spec.name          = "dolphin"
  spec.version       = Dolphin::VERSION
  spec.authors       = ["Coderhuang"]
  spec.email         = ["2282802627@qq.com"]

  spec.summary       = "下载抖音视频"
  spec.description   = "通过抖音分享链接下载对应的视频"
  spec.homepage      = "https://github.com/HZHCoder1990/dolphin"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/HZHCoder1990/dolphin"
  spec.metadata["changelog_uri"] = "https://github.com/HZHCoder1990/dolphin"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__ )) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = "dolphin"
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~>2.1.0"
  spec.add_dependency "claide","~> 1.1.0"
  spec.add_dependency "colored2","~>3.1.2"

end
