#!/usr/bin/env ruby

describe TestProject do
	describe "Convert Arabic numerals to English numerals" do
		subject {testproject}

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