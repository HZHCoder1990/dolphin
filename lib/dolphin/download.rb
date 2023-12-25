require 'claide'


module Dolphin
  class Command
    class Download < CLAide::Command
      self.summary = "下载抖音视频"
      self.description = "解析分享链接并下载视频到本地"

      self.arguments = [
        CLAide::Argument.new("link", true)
      ]

      def self.options
        [
          ['--save-path', '保存视频的路径']
        ]
      end

      def initialize(argv)
        @link = argv.shift_argument
        @save_path = argv.flag?('save-path')
        super
      end

      def run
        # 1.匹配下载链接
        urls = match_url(@link)
        unless urls.empty?
          require 'rest-client'
          require 'colored2'
          require_relative './constant'

          # 2.解析下载链接
          response = RestClient.get(ANALYSE_PREFIX + urls[0] , HEADERS)
          json_obj =  JSON.parse(response)
          video_url =  json_obj['video']
          if video_url.length > 0
            # 3.下载
            video_data = RestClient.get(video_url)
            puts "下载完成".green
            # 4.写入本地
            file = File.open('/Users/mac/Desktop/video.mp4', 'a+')
            if file
              file.syswrite(video_data)
            end
          end

        end
      end

      def match_url(string)
        urls = []
        regular = Regexp.new('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
        string.scan(regular) do |url|
          urls << url
        end
        urls
      end

      def validate!
        super
        unless @link
          help! "link is necessary!"
        end
      end

    end

  end
end

