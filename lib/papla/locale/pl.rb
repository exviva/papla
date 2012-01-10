{
  pl: {
    papla: {
      pluralization: lambda do |n|
        return :one if n == 1

        case n % 100
        when 12..14 then :other
        else
          case n % 10
          when 2..4 then :few
          else :other
          end
        end
      end
    }
  }
}
