class AddAllHeaderImagesToCloudinary < ActiveRecord::Migration
  def up
    headers_path = 'app/assets/images/headers'

    Dir.glob("#{headers_path}/*").each do |dir|
      directory = Dir.new(dir)
      directory.entries.reject{|entry| entry.start_with?('.')}.each do |filename|

        cloudinary_response = Cloudinary::Uploader.upload("#{dir}/#{filename}")
        identifier = cloudinary_response['url'].dup
        identifier.slice!('http://res.cloudinary.com/azandriacloud/image/upload/')

        dir_name = File.basename(directory)
        jumbotron = Jumbotron.new(title: 'This is my blog.', subtitle: 'Cool things, written by me',
          time_period_type: dir_name, image_description: description(dir_name))
        jumbotron[:image] = identifier # Set this separately to avoid the call to the JumbotronUploader
        jumbotron.save!

        puts "Saved #{filename}."
      end
    end

    add_default
  end

  private

  def add_default
    image_path = 'app/assets/images/headers/day/day_4.jpg'
    cloudinary_response = Cloudinary::Uploader.upload(image_path)
    identifier = cloudinary_response['url'].dup
    identifier.slice!('http://res.cloudinary.com/azandriacloud/image/upload/')

    jumbotron = Jumbotron.new(title: 'This is my blog.', subtitle: 'Cool things, written by me',
                              time_period_type: 'day', image_description: description('day'))
    jumbotron[:image] = identifier # Set this separately to avoid the call to the JumbotronUploader
    jumbotron.save!

    puts 'Saved default.'
  end

  def description(directory_name)
    case directory_name
      when 'day'
        'Daytime picture'
      when 'dusk'
        'Evening picture'
      when 'night'
        'Nighttime picture'
    end
  end
end
