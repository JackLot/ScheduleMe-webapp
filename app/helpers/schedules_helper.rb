require 'open-uri'

# Remove SSL protection so we can query testudo... rip
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

def arrayfromnoko(array)
  newarray = []
    array.each { |n|
      newarray.push(n.to_s)
    }
    return newarray
end 

module SchedulesHelper

	# Returns a json object of the datetimes associated with this class/sec
	def hitTestudo(did, classname, section)
		course_id = classname
	  	section_id = section

	  	page = Nokogiri::HTML(open('https://ntst.umd.edu/soc/search?courseId=' + course_id + '&sectionId=' + section_id + '&termId=201501&_openSectionsOnly=off&courseLevelFilter=ALL&classStartTime=&_classDays=on&teachingCenter=ALL'))
	  	
	  	for i in 0..(page.css("div.course").size - 1) do     
		  pageclass = page.css("div.course")[i]["id"] 

		  pagetitle = page.css("div.course")[i].css("span.course-title").text 

		  pagecredits = page.css("div.course")[i].css("span.course-min-credits").text

		  pageclassinfo = page.css("div.course")[i].css("div.approved-course-text").text 

		  sections = page.css("div.course")[i].css("div.sections-container") 

		  for j in 0..(sections.css("div.section").size - 1) do

		    section = sections.css("div.section")[j] 

		    sectionid = section.css("span.section-id").text 

		    sectioninstructor = section.css("span.section-instructor").text 

		    sectiondays = section.css("span.section-days").children
	    	sectiondays = arrayfromnoko(sectiondays)

		    sectionstarttime = section.css("span.class-start-time").children
		    sectionstarttime = arrayfromnoko(sectionstarttime)

		    sectionendtime = section.css("span.class-end-time").children
		    sectionendtime = arrayfromnoko(sectionendtime)

		    sectionbuilding = section.css("span.building-code").children
		    sectionbuilding = arrayfromnoko(sectionbuilding)

		    sectionclassroom = section.css("span.class-room").children
		    sectionclassroom = arrayfromnoko(sectionclassroom)

		    # NOTE: disregard H version, make regex to check if pageclass has H
		    if !pageclass.include? "H"
		    	(0..(sectiondays.length - 1)).each do |i|
			    	newclass = Testudo.create(classid: pageclass, classname: pagetitle,
			        credits: pagecredits, description: pageclassinfo,
			        section: sectionid, instructor: sectioninstructor,
			        sectiondays: sectiondays[i], starttimes: sectionstarttime[i],
			        endtimes: sectionendtime[i], building: sectionbuilding[i],
			        classroom: sectionclassroom[i], did: did)
			    end

		    end
		   end
		 end
		
		return Testudo.all
	end

end
