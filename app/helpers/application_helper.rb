module ApplicationHelper
  def application_name
    'Azandria Blog.'
  end

  def page_title
    if @page_title.present?
      "#{@page_title} | Joe Mahon's Blog"
    else
      'Joe Mahon\'s Blog'
    end

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
      },
      {
          text: 'flickr',
          link: 'https://www.flickr.com/photos/59680343@N03/'
      }
    ]
  end

  def mobile_nav
    main_navigation
  end
end
