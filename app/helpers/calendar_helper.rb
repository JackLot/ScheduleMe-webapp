module CalendarHelper
	$defaultColors = ["#3a87ad","#F5A51B","#F51B1B","#B01BF5","#9E9E9E"]

	def separateDays(days)
    	return days.split(/(?=[A-Z])/)
  	end


  	def parseDate(day)
	    if (day == "M")
	      return "monday"
	    elsif (day == "Tu")
	      return "tuesday"
	    elsif (day == "W")
	      return "wednesday"
	    elsif (day == "Th")
	      return "thursday"
	    else 
	      return "friday"   
	    end
  	end

	def get_classes(did)
		Time.zone = "Eastern Time (US & Canada)"
    	Chronic.time_class = Time.zone

		classes = []

		testudos = Testudo.where(did: did).to_a

		testudos.each{ |testudo|
			separateDays(testudo.sectiondays).each { |x|
				classes.push(
					{ 
						:title => testudo.classname,
						:start => Chronic.parse("this week's " + parseDate(x) + " at " + testudo.starttimes).to_s.sub(/-0500/, ""), 
            			:end => Chronic.parse("this week's " + parseDate(x) + " at " + testudo.endtimes).to_s.sub(/-0500/, ""),
            			:color => $defaultColors[0]
					}
				)

			}
			
		}
		return classes
	end
end
