desc "Generate statically the site"
task :generate do
  require 'jekyll'
  opt = Jekyll.configuration({})
  source = opt['source']
  destination = opt['destination']
  site = Jekyll::Site.new(opt.merge({'safe' => 'true'}))
  puts "Building site: #{source} -> #{destination}"
  begin
    site.process
  rescue Jekyll::FatalException => e
    puts
    puts "ERROR: YOUR SITE COULD NOT BE BUILT:"
    puts "------------------------------------"
    puts e.message
    exit(1)
  end
  puts "Successfully generated site: #{source} -> #{destination}"
end

desc "Powerfull deploy script"
task :deploy => :generate do
  exec "scp -r _site/* nolith@linusse.org:/var/www/nolith/abisso.org/www/" 
end
