Pod::Spec.new do |s|

  s.name         = "ClipboardManager"
  s.version      = "1.0.0"
  s.summary      = "A ClipboardManager is a simple way to use the system pasteboard."

  s.homepage     = "https://github.com/nik3212/ClipboardManager"

  s.license      = "MIT"

  s.author       = { "Nikita Vasilev" => "nv3212@gmail.com" }

  s.platform     = :macos, "10.12"

  s.source       = { :git => "https://github.com/nik3212/ClipboardManager.git", :tag => "#{s.version}" }

  s.source_files  = "ClipboardManager", "ClipboardManager/**/*.{h,m,mm,cpp,swift}"
  s.exclude_files = "Classes/Exclude"
end
