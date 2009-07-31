# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{agree2}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pelle Braendgaard"]
  s.date = %q{2009-07-31}
  s.description = %q{Ruby library for creating and managing agreements on Agree2}
  s.email = %q{support@agree2.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "History.txt",
     "License.txt",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "certs/sf_bundle.crt",
     "lib/agree2.rb",
     "lib/agree2/agreement.rb",
     "lib/agree2/base.rb",
     "lib/agree2/client.rb",
     "lib/agree2/party.rb",
     "lib/agree2/proxy_collection.rb",
     "lib/agree2/template.rb",
     "lib/agree2/user.rb",
     "spec/agreement_spec.rb",
     "spec/client_spec.rb",
     "spec/fixtures/agreement.json",
     "spec/fixtures/party.json",
     "spec/party_spec.rb",
     "spec/proxy_collection_spec.rb",
     "spec/spec_helper.rb",
     "spec/template_spec.rb",
     "spec/user_spec.rb"
  ]
  s.homepage = %q{http://agree2.com}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{agree2}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Ruby client library for Agree2}
  s.test_files = [
    "spec/agreement_spec.rb",
     "spec/client_spec.rb",
     "spec/party_spec.rb",
     "spec/proxy_collection_spec.rb",
     "spec/spec_helper.rb",
     "spec/template_spec.rb",
     "spec/user_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.3.5"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
    else
      s.add_dependency(%q<oauth>, [">= 0.3.5"])
      s.add_dependency(%q<json>, [">= 1.1.3"])
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.3.5"])
    s.add_dependency(%q<json>, [">= 1.1.3"])
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
  end
end
