module ApplicationHelper

  def application_name
    'Azandria Blog.'
  end

  def page_title
    'Joe Mahon\'s Blog'
  end

  def main_navigation
    [
      {
        text: 'twitter',
        link: 'http://twitter.com/onemahon'
      },
      {
        text: 'linked in',
        link: 'https://www.linkedin.com/in/josephmahon'
      }
    ]
  end

  def mobile_nav
    main_navigation
  end

  def random_jumbotron_image
    period = period_of_day

    file_names = Dir.glob("app/assets/images/headers/#{period}/*").map{|f| File.basename(f) }
    "headers/#{period}/#{file_names.shuffle.first}"
  end

  def period_of_day
    case Time.now.hour
      when 7..5
        'day'
      when 5..9
        'dusk'
      else
        'night'
    end
  end

end
