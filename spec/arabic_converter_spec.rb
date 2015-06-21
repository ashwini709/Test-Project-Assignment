#!/usr/bin/env ruby
require_relative "../arabic_converter"

describe TestProject do
	describe "Convert Arabic numerals to English numerals" do
		subject {testproject}

		context "Arabic numeral to English numeral(ex.1): Above 1000" do
			let(:testproject) { TestProject.new(:num => 8956354792561) }

			specify { expect(subject.arabic_to_eng).to eq("eight trillion nine hundred fifty six billion three hundred fifty four million seven hundred ninety two thousand five hundred sixty one")}
		end

		context "Arabic numeral to English numeral(ex.2): Above 1000" do
			let(:testproject) { TestProject.new(:num => 1537) }

			specify { expect(subject.arabic_to_eng).to eq("one thousand five hundred thirty seven")}
		end

		context "Arabic numeral to English numeral: Below 1000" do
			let(:testproject) { TestProject.new(:num => 909) }

			specify { expect(subject.arabic_to_eng).to eq("nine hundred nine")}
		end

		context "Arabic numeral to English numeral: Below 100" do
			let(:testproject) { TestProject.new(:num => 72) }

			specify { expect(subject.arabic_to_eng).to eq("seventy two")}
		end

		context "Arabic numeral to English numeral: Below 20" do
			let(:testproject) { TestProject.new(:num => 12) }

			specify { expect(subject.arabic_to_eng).to eq("twelve")}
		end

		context "How does 0 act?" do
			let(:testproject) { TestProject.new(:num => 0) }

			specify { expect(subject.arabic_to_eng).to eq("zero")}
		end
 
		context "Incorrect arabic numeral is not convertible" do
			let(:testproject) { TestProject.new(:num => -3) }

			specify { expect(subject.arabic_to_eng).to eq(false)}
		end
	end	
end