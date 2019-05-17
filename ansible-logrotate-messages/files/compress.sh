for file in `ls /var/lib/dcos/messages-2019* | egrep -v xz`
	do
		echo "Compressing $file"
		xz $file&
		pid=$!
		while ps -p $pid &>/dev/null
			do
				echo "still compressing"
				sleep 20
			done
	done
