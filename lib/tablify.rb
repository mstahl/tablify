module Tablify
  def self.table(array, opts = {})
    headers = array.map(&:keys).flatten.uniq.sort

    if opts[:include]
      headers = headers & opts[:include]
    end
    if opts[:exclude]
      headers = headers - opts[:exclude]
    end

    column_widths = headers.map(&:length)

    array.each do |hash|
      headers.each_with_index do |header, i|
        l = hash[header].to_s.length
        if l > column_widths[i]
          column_widths[i] = l
        end
      end
    end

    lines = [horizontal_rule(column_widths)]
    lines << aligned_row(headers, column_widths)
    lines << horizontal_rule(column_widths)
    array.each do |row|
      row_elements = headers.map{|h| row[h]}
      lines << aligned_row(row_elements, column_widths)
    end
    lines << horizontal_rule(column_widths)

    lines.join("\n")
  end

  private

  def self.aligned_row(row, widths)
    "| " + (widths.map{|width| "%0#{width}s"}.join(" | ") % row) + " |"
  end

  def self.horizontal_rule(widths)
    "+" + widths.map{|w| "-" * (w + 2)}.join("+") + "+"
  end
end
