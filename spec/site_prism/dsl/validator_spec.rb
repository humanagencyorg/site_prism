# frozen_string_literal: true

describe SitePrism::DSL::Validator do
  let(:validator) do
    Class.new do
      extend SitePrism::DSL::Validator
    end
  end

  describe '.name_invalid?' do
    context 'with a blacklisted prefix' do
      subject { validator.name_invalid?('no_we_are_not_allowed') }

      it { is_expected.to be true }
    end

    context 'with a blacklisted suffix' do
      subject { validator.name_invalid?('i_am_also_not_allowed_') }

      it { is_expected.to be true }
    end

    context 'with invalid characters' do
      subject { validator.name_invalid?('this_contains%20!invalidCH4RZ$') }

      it { is_expected.to be true }
    end

    context 'with a starting upper-case character' do
      subject { validator.name_invalid?('MUST_start_lowercase') }

      it { is_expected.to be true }
    end

    context 'with an invalid name' do
      subject { validator.name_invalid?('attributes') }

      it { is_expected.to be true }
    end

    context 'with a valid string' do
      subject { validator.name_invalid?('abcdef123_XYZ') }

      it { is_expected.to be_nil }
    end
  end
end
