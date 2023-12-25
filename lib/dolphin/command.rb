
module Dolphin
  require 'claide'

  class Command < CLAide::Command

    self.abstract_command = true
    self.command = 'dol'
    self.version = VERSION
    self.description = "通过抖音分享链接下载视频"
  end
end


