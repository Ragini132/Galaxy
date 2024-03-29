SELECT 
   p.objID, p.ra, p.dec, p.run, p.rerun, p.camcol, p.field,
   dbo.fPhotoTypeN(p.type) as type,
   p.modelMag_u, p.modelMag_g, p.modelMag_r, p.modelMag_i, p.modelMag_z,
   s.specObjID, s.plate, s.mjd, s.fiberID, s.z, s.zConf, s.fiberMag_u, s.fiberMag_g,
   s.fiberMag_r, s.fiberMag_i, s.fiberMag_z, 
   sli.name, sli.ew, sli.ewErr, sli.mag, sli.magErr, sli.waveMin, 
   sli.waveMax, sli.z, sli.sn, sli.specobjID
FROM #upload u
      JOIN #x x ON x.up_id = u.up_id
      JOIN PhotoTag p ON p.objID = x.objID
      JOIN SpecObjAll s ON p.objID = s.bestObjID
      JOIN SpecLineIndex sli ON p.SpecObjID = sli.SpecObjID
ORDER by x.up_id
