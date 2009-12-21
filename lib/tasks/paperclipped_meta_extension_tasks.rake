namespace :radiant do
  namespace :extensions do
    namespace :paperclipped_meta do
      
      desc "Runs the migration of the Paperclipped Meta extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PaperclippedMetaExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PaperclippedMetaExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Paperclipped Meta to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from PaperclippedMetaExtension"
        Dir[PaperclippedMetaExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PaperclippedMetaExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
