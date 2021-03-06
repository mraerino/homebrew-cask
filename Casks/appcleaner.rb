cask 'appcleaner' do
  if MacOS.version <= :mavericks
    version '2.3'
    sha256 '69da212e2972e23e361c93049e4b4505d7f226aff8652192125f078be7eecf7f'
  else
    version '3.4'
    sha256 '0c60d929478c1c91e0bad76d3c04795665c07a05e45e33321db845429c9aefa8'
    appcast 'https://freemacsoft.net/appcleaner/Updates.xml',
            checkpoint: '2743c995613fd53c24e271384e2de79eb781dd4d21fd32627e3ac244704e1b04'
  end

  url "https://www.freemacsoft.net/downloads/AppCleaner_#{version}.zip"
  name 'AppCleaner'
  homepage 'https://freemacsoft.net/appcleaner/'

  auto_updates true
  depends_on macos: '>= :tiger'

  app 'AppCleaner.app'

  uninstall quit: 'net.freemacsoft.AppCleaner-SmartDelete'

  zap delete: [
                '~/Library/Caches/net.freemacsoft.AppCleaner',
                '~/Library/Preferences/net.freemacsoft.AppCleaner.plist',
                '~/Library/Saved Application State/net.freemacsoft.AppCleaner.savedState',
                '~/Library/Preferences/net.freemacsoft.AppCleaner-SmartDelete.plist',
              ]
end
