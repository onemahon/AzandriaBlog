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
end
