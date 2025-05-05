git:
	echo $(MAKECMDGOALS)
	git add --all
	git commit -m "ZoV"
	git push --all

