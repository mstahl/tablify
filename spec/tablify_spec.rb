require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Tablify do
  describe '::table' do

    context 'with only an array argument, with no options specified' do
      it 'should convert an array of hashes by itself into a table with alphabetized key columns' do
        table = [
          {
            a: 1,
            b: 2,
            c: 3
          }, {
            a: 4,
            b: 5,
            c: 6
          }, {
            a: 7,
            b: 8,
            c: 9
          }
        ]

        Tablify.table(table).strip.should == %{
+---+---+---+
| a | b | c |
+---+---+---+
| 1 | 2 | 3 |
| 4 | 5 | 6 |
| 7 | 8 | 9 |
+---+---+---+
}.strip
      end

      it 'should convert an array of hashes when not all hashes contain all keys' do
        table = [
          {
            a: 1,
            c: 3
          }, {
            b: 5,
          }, {
            a: 7,
            c: 9
          }
        ]

        Tablify.table(table).strip.should == %{
+---+---+---+
| a | b | c |
+---+---+---+
| 1 |   | 3 |
|   | 5 |   |
| 7 |   | 9 |
+---+---+---+
}.strip
      end

      it 'should throw an error if called on a non-enumerable' do
        pending "Not implemented yet."
      end

      it 'should throw an error if called on an array that contains nil or non-Hash elements' do
        pending "Not implemented yet."
      end
    end

    context 'with :include specified' do
      it 'should only include the columns specified with :include' do
        table = [
          {
            a: 1,
            b: 2,
            c: 3
          }, {
            a: 4,
            b: 5,
            c: 6
          }, {
            a: 7,
            b: 8,
            c: 9
          }
        ]

        Tablify.table(table, include: [:a, :c]).strip.should == %{
+---+---+
| a | c |
+---+---+
| 1 | 3 |
| 4 | 6 |
| 7 | 9 |
+---+---+
}.strip
      end

      it 'should convert an array of hashes when not all hashes contain all keys' do
        pending "Not implemented yet."
      end
    end

    context 'with :exclude specified' do
      it 'should only include the columns not specified with :exclude' do
        table = [
          {
            a: 1,
            b: 2,
            c: 3
          }, {
            a: 4,
            b: 5,
            c: 6
          }, {
            a: 7,
            b: 8,
            c: 9
          }
        ]

        Tablify.table(table, exclude: [:a]).strip.should == %{
+---+---+
| b | c |
+---+---+
| 2 | 3 |
| 5 | 6 |
| 8 | 9 |
+---+---+
}.strip
      end

      it 'should convert an array of hashes when not all hashes contain all keys' do
        pending "Not implemented yet."
      end
    end

    context 'with :horizontal specified' do
      it 'should convert an array of hashes, arranging their keys in the first column of a table' do
        pending "Not implemented yet."
      end

      it 'should convert an array of hashes when not all hashes contain all keys' do
        pending "Not implemented yet."
      end
    end

  end

  describe '::paragraph' do
    pending "Not implemented yet."
  end
end
