# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Library do
  describe 'constructor' do
    describe 'hash with data specified' do
      let(:book)   { build(:book) }
      let(:author) { build(:author) }
      let(:reader) { build(:reader) }
      let(:order)  { build(:order) }

      let(:data) do
        {
          books:   [book],
          authors: [author],
          readers: [reader],
          orders:  [order]
        }
      end

      subject { Library.new(data) }

      it 'initialize books instance variable with empty array' do
        expect(subject.instance_variable_get(:@books)).to eq([book])
      end

      it 'initialize authors instance variable with empty array' do
        expect(subject.instance_variable_get(:@authors)).to eq([author])
      end

      it 'initialize orders instance variable with empty array' do
        expect(subject.instance_variable_get(:@orders)).to eq([order])
      end

      it 'initialize readers instance variable with empty array' do
        expect(subject.instance_variable_get(:@readers)).to eq([reader])
      end
    end

    describe 'no args specified' do
      subject { Library.new }

      it 'initialize books instance variable with empty array' do
        expect(subject.instance_variable_get(:@books)).to eq([])
      end

      it 'initialize authors instance variable with empty array' do
        expect(subject.instance_variable_get(:@authors)).to eq([])
      end

      it 'initialize orders instance variable with empty array' do
        expect(subject.instance_variable_get(:@orders)).to eq([])
      end

      it 'initialize readers instance variable with empty array' do
        expect(subject.instance_variable_get(:@readers)).to eq([])
      end
    end
  end

  describe 'getters' do
    let(:book)   { build(:book) }
    let(:author) { build(:author) }
    let(:reader) { build(:reader) }
    let(:order)  { build(:order) }

    let(:data) do
      {
        books:   [book],
        authors: [author],
        readers: [reader],
        orders:  [order]
      }
    end

    subject { Library.new(data) }

    it 'has getter for books attribute' do
      expect(subject.books).to eq([book])
    end

    it 'has getter for authors attribute' do
      expect(subject.authors).to eq([author])
    end

    it 'has getter for orders attribute' do
      expect(subject.orders).to eq([order])
    end

    it 'has getter for readers attribute' do
      expect(subject.readers).to eq([reader])
    end
  end

  describe 'setters' do
    let(:book)   { build(:book) }
    let(:author) { build(:author) }
    let(:reader) { build(:reader) }
    let(:order)  { build(:order) }

    subject { Library.new }

    it 'has setter for books attribute' do
      subject.books = [book]

      expect(subject.instance_variable_get(:@books)).to eq([book])
    end

    it 'has setter for authors attribute' do
      subject.authors = [author]

      expect(subject.instance_variable_get(:@authors)).to eq([author])
    end

    it 'has setter for readers attribute' do
      subject.readers = [reader]

      expect(subject.instance_variable_get(:@readers)).to eq([reader])
    end

    it 'has setter for orders attribute' do
      subject.orders = [order]

      expect(subject.instance_variable_get(:@orders)).to eq([order])
    end
  end

  describe '#who_often_takes_the_books' do
    describe 'not empty library' do
      it 'returns reader' do
        reader1 = build(:reader)
        reader2 = build(:reader)
        reader3 = build(:reader)

        data = {
          orders: [
            build_list(:order, 3, reader: reader1),
            build_list(:order, 2, reader: reader2),
            build_list(:order, 1, reader: reader3)
          ].flatten
        }

        library = Library.new(data)

        expect(library.who_often_takes_the_books).to eq(reader1)
      end
    end

    describe 'empty library' do
      it 'returns nil' do
        library = Library.new

        expect(library.who_often_takes_the_books).to be_nil
      end
    end
  end

  describe '#what_is_the_most_popular_book' do
    describe 'not empty library' do
      it 'returns book' do
        book1 = build(:book)
        book2 = build(:book)
        book3 = build(:book)

        data = {
          orders: [
            build_list(:order, 1, book: book1),
            build_list(:order, 2, book: book2),
            build_list(:order, 3, book: book3)
          ].flatten
        }

        library = Library.new(data)

        expect(library.what_is_the_most_popular_book).to eq(book3)
      end
    end

    describe 'empty library' do
      it 'returns nil' do
        library = Library.new

        expect(library.what_is_the_most_popular_book).to be_nil
      end
    end
  end

  describe '#how_many_people_ordered_one_of_the_three_most_popular_books' do
    describe 'not empty library' do
      it 'returns count of readers' do
        book1 = build(:book)
        book2 = build(:book)
        book3 = build(:book)
        book4 = build(:book)

        data = {
          orders: [
            build_list(:order, 3, book: book1),
            build_list(:order, 3, book: book2),
            build_list(:order, 3, book: book3),
            build_list(:order, 1, book: book4)
          ].flatten
        }

        library = Library.new(data)

        expect(library.how_many_people_ordered_one_of_the_three_most_popular_books).to eq(9)
      end
    end

    describe 'empty library' do
      it 'returns zero' do
        library = Library.new

        expect(library.how_many_people_ordered_one_of_the_three_most_popular_books).to eq(0)
      end
    end
  end
end
