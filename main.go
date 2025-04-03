	pid, ok = metaDataMap["PID"].(float64)
	if !ok {
		oe.logger.PrintError("PID is not an int in MetaData [%v]", reflect.TypeOf(metaDataMap["PID"]))
		// return log object to pool
		oe.returnLogObjectToPool(logWrapper)
		continue
	}
