include GroupsHelper
module CalendarHelper
	$defaultColors = ["#3a87ad","#F5A51B","#F51B1B","#B01BF5","#9E9E9E"]

	def get_schedules(group_name)
		schedules = []

		users = getUsers(group_name)

		users.each_with_index { |u, i|
			schedules.concat(get_classes(u, $defaultColors[i]))
		}

		return schedules
	end

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

	def get_classes(did, color)
		Time.zone = "Eastern Time (US & Canada)"
    	Chronic.time_class = Time.zone

		classes = []

		testudos = Testudo.where(did: did).to_a

		testudos.each{ |testudo|
			separateDays(testudo.sectiondays).each { |x|
				classes.push(
					{ 
						:title => testudo.classid.to_s + ", section " + testudo.section.to_s,
						:start => Chronic.parse("this week's " + parseDate(x) + " at " + testudo.starttimes).to_s.sub(/-0500/, ""), 
            			:end => Chronic.parse("this week's " + parseDate(x) + " at " + testudo.endtimes).to_s.sub(/-0500/, ""),
            			:color => color
					}
				)

			}
			
		}
		return classes
	end
end
