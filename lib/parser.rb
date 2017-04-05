module Loba
  module TaskSupport

    class Parser
      def initialize
        @path = nil
        @text_state = {}
      end

#     if path != @path
#       @path = path
#       @comment_state[@path] = false
#     else
#       # turn off comment state if last line was an "=end"
#       if @comment_state[@path] == :end_pending
#         @comment_state[@path] = false
#       end
#
#       # turn on comment state if current line is a "=begin"
#       if begin?(line)
#         @comment_state[@path] = true
#       end
#
#       # if current line is a "=end", treat current line as a comment, but
#       # mark it as ended for the next line
#       if end?(line)
#         @comment_state[@path] = :end_pending
#       end
#     end



      def parse_line(line)
        return [{content: line, type: :unquoted}] if line.empty?

        @current_line = line.freeze

        #test for comment block ("=begin"/"=end")
        #x = parse_for_comment_block(line)

        # separate any tailing comment (after a '#')
        parsed_for_tailing_comment = parse_for_tailing_comment
        @subject = parsed_for_tailing_comment[:subject].freeze
        tail = parsed_for_tailing_comment[:tail].freeze

        # split up non-comment part into quoted and unquoted text
        parsed = parse_for_quotes

        # tack on any tailing comment
        parsed << {content: tail, type: :comment}
puts parsed.inspect

        parsed
      end

    private
      # separate any tailing comment (after a '#')
      TAIL_COMMENT = /(?:[\#].*$)/.freeze
      def parse_for_tailing_comment
        default = {subject: "", tail: ""}
        return default unless @current_line.is_a? String

        # separate any tailing comment (after a '#')
        partitioned_for_comments = @current_line.partition(TAIL_COMMENT)
        subject = partitioned_for_comments[0]
        tail = partitioned_for_comments[1] + partitioned_for_comments[2]

        {subject: subject, tail: tail}
      end

      QUOTED_TEXT = /\"[^"\\\r\n]*(?:\\?.[^"\\\r\n]*)\"|\'[^'\\\r\n]*(?:\\?.[^'\\\r\n]*)\'/.freeze
      def parse_for_quotes
        return [] unless @subject.is_a? String

        parsed = []
        loop do
          parts = @subject.partition(QUOTED_TEXT)
          parsed << {content: parts[0], type: :unquoted}
          parsed << {content: parts[1], type: :quoted} unless parts[1].empty?
          @subject = parts[2]
          break if @subject.empty?
        end

        parsed
      end


      def begins_comment_block?(line)
        line =~ /^\=begin.*$/
      end

      def ends_comment_block?(line)
        line =~ /^\=end.*$/
      end

      private_constant :TAIL_COMMENT
      private_constant :QUOTED_TEXT
    end
    private_constant :Parser  # dissuade external use

  end
end

# class CommentBlockTrace
#   def initialize
#     @path = nil
#     @comment_state = {}
#   end
#
#   def trace(path, line)
#     if path != @path
#       @path = path
#       @comment_state[@path] = false
#     else
#       # turn off comment state if last line was an "=end"
#       if @comment_state[@path] == :end_pending
#         @comment_state[@path] = false
#       end
#
#       # turn on comment state if current line is a "=begin"
#       if begin?(line)
#         @comment_state[@path] = true
#       end
#
#       # if current line is a "=end", treat current line as a comment, but
#       # mark it as ended for the next line
#       if end?(line)
#         @comment_state[@path] = :end_pending
#       end
#     end
#   end
#
#   def within_comment_block?
#     # anything but false is true
#     !!@comment_state[@path] rescue false
#   end
#
# private
#   def begin?(line)
#     line =~ /^\=begin.*$/
#   end
#
#   def end?(line)
#     line =~ /^\=end.*$/
#   end
# end
# private_constant :BlockCommentContext  # dissuade external use

# def parse_line(line, options = {})
#   return [{content: line, type: :unquoted}] if line.empty?
#   return [{content: line, type: :comment}] if options[:in_comment_block]
#
#   match_on_tail_comment = /(?:[\#].*$)/
#   match_on_quoted_text = /\"[^"\\\r\n]*(?:\\?.[^"\\\r\n]*)\"|\'[^'\\\r\n]*(?:\\?.[^'\\\r\n]*)\'/
#
#   # separate any tailing comment (after a '#')
#   partitioned_for_comments = line.partition(match_on_tail_comment)
#   subject = partitioned_for_comments[0]
#   tail = partitioned_for_comments[1] + partitioned_for_comments[2]
#
#   # split up non-comment part into quoted and unquoted text
#   parsed = []
#   loop do
#     parts = subject.partition(match_on_quoted_text)
#     parsed << {content: parts[0], type: :unquoted}
#     parsed << {content: parts[1], type: :quoted} unless parts[1].empty?
#     subject = parts[2]
#     break if subject.empty?
#   end
#
#   parsed << {content: tail, type: :comment}
#
#   parsed
# end
