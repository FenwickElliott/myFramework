Gem::Specification.new do |spec|
    spec.name          = "frame"
    spec.version       = '0.0.0'
    spec.authors       = ["Charles Fenwick Elliott"]
    spec.email         = ["Charles@FenwickElliott.io"]
  
    spec.summary       = %q{aNother Rack Framework}
    spec.description   = %q{A framework for rack written for educational purposes}
    spec.homepage      = "https://fenwickelliott.io"
    spec.license       = "MIT"
    spec.add_development_dependency "bundler", "~> 1.15"
  #   spec.add_development_dependency "rake", "~> 10.0"
    spec.add_development_dependency "pry", "~> 0.10"
    spec.add_runtime_dependency "erubis", "~>2.7"
    spec.add_runtime_dependency "bloc_record", "0.0.4"
    # spec.add_runtime_dependency "JSON", " ~>2.1"
    spec.add_runtime_dependency "rack", "~> 2.0"
  end