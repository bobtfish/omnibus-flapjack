name "flapjack"

version = '0.8.5' # ENV['FLAPJACK_BUILD_TAG']
version "v#{version}"

dependency "ruby"
dependency "rubygems"
dependency "bundler"

source :git => "git@git.yelpcorp.com/mirrors/flpjck/flapjack"

relative_path "flapjack"

build do
  # Install all dependencies
  bundle "install --path=#{install_dir}/embedded/service/gem"

  # Build + install the gem
  bundle "exec rake build"
  gem [ "install pkg/flapjack*.gem",
        "--bindir #{install_dir}/bin",
        "--no-rdoc --no-ri" ].join(" ")
end


