use Mojo::Base -strict;
use Test::More;
 
use Webservice::Shipment::Carrier::FedEx;
use Webservice::Shipment::MockUserAgent;
 
my $mock = Webservice::Shipment::MockUserAgent->new;
 
my $fedex = Webservice::Shipment::Carrier::FedEx->new(
  date_format => '%m/%d/%y',
  ua => $mock,
  username => 'johnq',
  password => 'p@ssword',
  api_key => 'COOLBEANS',
);
 
subtest 'delivered 1' => sub {
  $mock->mock_response({text => <<'---JSON', format => 'json'});
{"TrackPackagesResponse":{"successful":true,"passedLoggedInCheck":false,"errorList":[{"code":"0","message":"Request was successfully processed.","source":null,"rootCause":null}],"packageList":[{"trackingNbr":"740477193998","trackingQualifier":"12017\u007e740477193998\u007eFDEG","trackingCarrierCd":"FDXG","trackingCarrierDesc":"FedEx Ground","displayTrackingNbr":"740477193998","shipperCmpnyName":"","shipperName":"","shipperAddr1":"","shipperAddr2":"","shipperCity":"Ann Arbor","shipperStateCD":"MI","shipperZip":"","shipperCntryCD":"US","shipperPhoneNbr":"","shippedBy":"","recipientCmpnyName":"","recipientName":"","recipientAddr1":"","recipientAddr2":"","recipientCity":"BELLE PLAINE","recipientStateCD":"MN","recipientZip":"","recipientCntryCD":"US","recipientPhoneNbr":"","shippedTo":"","keyStatus":"Delivered","keyStatusCD":"DL","lastScanStatus":"","lastScanDateTime":"","receivedByNm":"Signature not required","subStatus":"Signature not required","mainStatus":"","statusBarCD":"DL","shortStatus":"","shortStatusCD":"","statusLocationAddr1":"","statusLocationAddr2":"","statusLocationCity":"Belle Plaine","statusLocationStateCD":"MN","statusLocationZip":"","statusLocationCntryCD":"US","statusWithDetails":"Delivered\u003a 10\u002f27\u002f2017 10\u003a18 am Signed for by\u003aSignature not required\u003b Belle Plaine, MN\u003b Left at front door.Signature Service not requested.","halType":"","halCmpnyName":"","isHALAddress":false,"shipDt":"2017\u002d10\u002d25T00\u003a00\u003a00\u002d06\u003a00","displayShipDt":"10\u002f25\u002f2017","displayShipTm":"","displayShipDateTime":"10\u002f25\u002f2017","pickupDt":"2017\u002d10\u002d25T00\u003a00\u003a00\u002d06\u003a00","displayPickupDt":"10\u002f25\u002f2017","displayPickupTm":"","displayPickupDateTime":"10\u002f25\u002f2017","estDeliveryDt":"","estDeliveryTm":"","displayEstDeliveryDt":"","displayEstDeliveryTm":"","displayEstDeliveryDateTime":"","actDeliveryDt":"2017\u002d10\u002d27T10\u003a18\u003a16\u002d05\u003a00","displayActDeliveryDt":"10\u002f27\u002f2017","displayActDeliveryTm":"10\u003a18 am","displayActDeliveryDateTime":"10\u002f27\u002f2017 10\u003a18 am","tenderedDt":"2017\u002d10\u002d25T00\u003a00\u003a00\u002d06\u003a00","displayTenderedDt":"10\u002f25\u002f2017","displayTenderedTm":"","displayTenderedDateTime":"10\u002f25\u002f2017","apptDeliveryDt":"","displayApptDeliveryDt":"","displayApptDeliveryTm":"","displayApptDeliveryDateTime":"","nickName":"","note":"","matchedAccountList":[""],"fxfAdvanceETA":"","fxfAdvanceReason":"","fxfAdvanceStatusCode":"","fxfAdvanceStatusDesc":"","destLink":"","originLink":"","hasBillOfLadingImage":false,"hasBillPresentment":false,"signatureRequired":0,"totalKgsWgt":"","displayTotalKgsWgt":"","totalLbsWgt":"","displayTotalLbsWgt":"","displayTotalWgt":"","pkgKgsWgt":"0.45","displayPkgKgsWgt":"0.45 kgs","pkgLbsWgt":"1.0","displayPkgLbsWgt":"1 lbs","displayPkgWgt":"1 lbs \u002f 0.45 kgs","totalDIMLbsWgt":"","displayTotalDIMLbsWgt":"","totalDIMKgsWgt":"","displayTotalDIMKgsWgt":"","displayTotalDIMWgt":"","dimensions":"","masterTrackingNbr":"","masterQualifier":"","masterCarrierCD":"","originalOutboundTrackingNbr":null,"originalOutboundQualifier":"","originalOutboundCarrierCD":"","invoiceNbrList":[""],"referenceList":[""],"doorTagNbrList":[""],"referenceDescList":[""],"purchaseOrderNbrList":[""],"billofLadingNbrList":[""],"shipperRefList":[""],"rmaList":[""],"deptNbrList":[""],"shipmentIdList":["604542017102420"],"tcnList":[""],"partnerCarrierNbrList":[""],"hasAssociatedShipments":false,"hasAssociatedReturnShipments":false,"assocShpGrp":0,"drTgGrp":["0"],"associationInfoList":[{"trackingNumberInfo":{"trackingNumber":"","trackingQualifier":"","trackingCarrier":"","processingParameters":null},"associatedType":""}],"returnReason":"","returnRelationship":null,"skuItemUpcCdList":[""],"receiveQtyList":[""],"itemDescList":[""],"partNbrList":[""],"serviceCD":"GROUND\u005fHOME\u005fDELIVERY","serviceDesc":"FedEx Home Delivery","serviceShortDesc":"HD","packageType":"PACKAGE","packaging":"Package","clearanceDetailLink":"","showClearanceDetailLink":false,"manufactureCountryCDList":[""],"commodityCDList":[""],"commodityDescList":[""],"cerNbrList":[""],"cerComplaintCDList":[""],"cerComplaintDescList":[""],"cerEventDateList":[""],"displayCerEventDateList":[""],"totalPieces":"1","specialHandlingServicesList":[""],"shipmentType":"","pkgContentDesc1":"","pkgContentDesc2":"","docAWBNbr":"","originalCharges":"","transportationCD":"","transportationDesc":"","dutiesAndTaxesCD":"","dutiesAndTaxesDesc":"","origPieceCount":"","destPieceCount":"","billNoteMsg":"","goodsClassificationCD":"","receipientAddrQty":"0","deliveryAttempt":"0","codReturnTrackNbr":"","returnMovementStatus":null,"scanEventList":[{"date":"2017\u002d10\u002d27","time":"10\u003a18\u003a16","gmtOffset":"\u002d05\u003a00","status":"Delivered","statusCD":"DL","scanLocation":"Belle Plaine, MN","scanDetails":"Left at front door. Signature Service not requested.","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":true,"isDelException":false},{"date":"2017\u002d10\u002d27","time":"07\u003a56\u003a00","gmtOffset":"\u002d05\u003a00","status":"On FedEx vehicle for delivery","statusCD":"OD","scanLocation":"SHAKOPEE, MN","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d27","time":"06\u003a16\u003a00","gmtOffset":"\u002d05\u003a00","status":"At local FedEx facility","statusCD":"AR","scanLocation":"SHAKOPEE, MN","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d26","time":"21\u003a14\u003a02","gmtOffset":"\u002d05\u003a00","status":"Departed FedEx location","statusCD":"DP","scanLocation":"CHICAGO, IL","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d26","time":"19\u003a22\u003a00","gmtOffset":"\u002d05\u003a00","status":"Arrived at FedEx location","statusCD":"AR","scanLocation":"CHICAGO, IL","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d26","time":"17\u003a49\u003a49","gmtOffset":"\u002d05\u003a00","status":"In transit","statusCD":"IT","scanLocation":"BURBANK, IL","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d26","time":"06\u003a49\u003a43","gmtOffset":"\u002d04\u003a00","status":"Departed FedEx location","statusCD":"DP","scanLocation":"PERRYSBURG, OH","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d26","time":"00\u003a01\u003a00","gmtOffset":"\u002d04\u003a00","status":"Arrived at FedEx location","statusCD":"AR","scanLocation":"PERRYSBURG, OH","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d25","time":"22\u003a22\u003a30","gmtOffset":"\u002d04\u003a00","status":"Left FedEx origin facility","statusCD":"DP","scanLocation":"SALINE, MI","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d25","time":"20\u003a44\u003a00","gmtOffset":"\u002d04\u003a00","status":"Arrived at FedEx location","statusCD":"AR","scanLocation":"SALINE, MI","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d25","time":"18\u003a42\u003a00","gmtOffset":"\u002d04\u003a00","status":"Picked up","statusCD":"PU","scanLocation":"SALINE, MI","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false},{"date":"2017\u002d10\u002d24","time":"18\u003a21\u003a00","gmtOffset":"\u002d04\u003a00","status":"Shipment information sent to FedEx","statusCD":"OC","scanLocation":"","scanDetails":"","scanDetailsHtml":"","rtrnShprTrkNbr":"","isException":false,"isClearanceDelay":false,"isDelivered":false,"isDelException":false}],"originAddr1":"","originAddr2":"","originCity":"SALINE","originStateCD":"MI","originZip":"","originCntryCD":"US","originLocationID":"","originTermCity":"SALINE","originTermStateCD":"MI","destLocationAddr1":"","destLocationAddr2":"","destLocationCity":"","destLocationStateCD":"","destLocationZip":"","destLocationCntryCD":"","destLocationID":"","destLocationTermCity":"","destLocationTermStateCD":"","destAddr1":"","destAddr2":"","destCity":"BELLE PLAINE","destStateCD":"MN","destZip":"","destCntryCD":"US","halAddr1":"","halAddr2":"","halCity":"","halStateCD":"","halZipCD":"","halCntryCD":"","actualDelAddrCity":"Belle Plaine","actualDelAddrStateCD":"MN","actualDelAddrZipCD":"","actualDelAddrCntryCD":"US","totalTransitMiles":"","excepReasonList":[""],"excepActionList":[""],"exceptionReason":"","exceptionAction":"","statusDetailsList":["Left at front door.Signature Service not requested."],"trackErrCD":"","destTZ":"\u002d05\u003a00","originTZ":"\u002d04\u003a00","isMultiStat":"0","multiStatList":[{"multiPiec":"","multiTm":"","multiDispTm":"","multiSta":""}],"maskMessage":"","deliveryService":"","milestoDestination":"","terms":"Shipper","payorAcctNbr":"","meterNumber":"","originUbanizationCode":"","originCountryName":"","isOriginResidential":false,"halUrbanizationCD":"","halCountryName":"","actualDelAddrUrbanizationCD":"","actualDelAddrCountryName":"","destUrbanizationCD":"","destCountryName":"","delToDesc":"","recpShareID":"3c1pu41zcl9yv2mdondu2p6p3","shprShareID":"46ofell4z1imm6bs5smlji62b","requestedAppointmentInfoList":[{"spclInstructDesc":"","delivOptn":"","delivOptnStatus":"","reqApptWdw":"","reqApptDesc":"","rerouteTRKNbr":"","beginTm":"","endTm":""}],"defaultCDOType":"CDO","returnAuthorizationName":"","totalCustomsValueAmount":"","totalCustomsValueCurrency":"","packageInsuredValueAmount":"","packageInsuredValueCurrency":"","estDelTimeWindow":{"estDelTmWindowStart":"","estDelTmWindowEnd":"","displayEstDelTmWindowTmStart":"","displayEstDelTmWindowTmEnd":""},"standardTransitTimeWindow":{"stdTransitTimeStart":"","displayStdTransitTimeStart":"","stdTransitTimeEnd":"2017\u002d10\u002d27T00\u003a00\u003a00\u002d06\u003a00","displayStdTransitTimeEnd":""},"standardTransitDate":{"stdTransitDate":"2017\u002d10\u002d27T00\u003a00\u003a00\u002d06\u003a00","displayStdTransitDate":"10\u002f27\u002f2017"},"pkgDimIn":"","pkgDimCm":"","returnedToShipperTrackNbr":"","commodityInfoList":[{"countryOfManufacture":"","harmonizedCode":"","description":""}],"statusActionDesc":"","destinationGeoCoordinate":null,"serviceCommitMessage":"","brokerName":"","brokerCompanyName":"","buyerSoldToPartyName":"","buyerSoldToPartyCompanyName":"","importerOfRecordCompanyName":"","importerOfRecordName":"","consolidationDetails":null,"exclusionReasonDetails":null,"matched":false,"mpstype":"","rthavailableCD":"","excepReasonListNoInit":[""],"excepActionListNoInit":[""],"fxfAdvanceNotice":true,"codrequired":false,"statusDetailsListNoInit":["Left at front door.Signature Service not requested."],"isSuccessful":true,"isException":false,"isPrePickup":false,"isPickup":false,"isShipmentException":false,"isClearanceDelay":false,"isDelivered":true,"isPending":false,"isInFedExPossession":false,"isDroppedOff":false,"isCanceled":false,"isConsolidationDetail":false,"isFSM":false,"isFreight":false,"isCustomCritical":false,"isInvalid":false,"errorList":[{"code":"","message":"","source":null,"rootCause":null}],"isExpired":false,"isInProgress":true,"isResidential":true,"isMPS":false,"isGMPS":false,"isReturn":false,"isDeliveryToday":false,"isDocumentAvailable":false,"isShipDtLabel":false,"isChildPackage":false,"isParentPackage":false,"isReclassifiedAsSingleShipment":false,"isMaskShipper":false,"isHALResidential":false,"isActualDelAddrResidential":false,"isDuplicate":false,"isSave":false,"isHistorical":false,"isTenderedNotification":false,"isDeliveredNotification":true,"isExceptionNotification":false,"isEstimatedDeliveryDateChangeNotification":false,"isCurrentStatusNotification":false,"isAnticipatedShipDtLabel":false,"isShipPickupDtLabel":true,"isActualPickupLabel":false,"isOrderReceivedLabel":false,"isEstimatedDeliveryDtLabel":false,"isDeliveryDtLabel":false,"isActualDeliveryDtLabel":true,"isOrderCompleteLabel":false,"isTenderedDtLabel":false,"isEstDelTmWindowLabel":false,"isUnknownDirection":false,"isSpod":true,"isSignatureAvailable":false,"isSignatureThumbnailAvailable":false,"isOriginalOutBound":false,"isHalEligible":false,"isFedexOfficeOnlineOrders":false,"isFedexOfficeInStoreOrders":false,"isMultipleStop":false,"isReqEstDelDt":false,"isMtchdByRecShrID":false,"isMtchdByShiprShrID":false,"isHistoricalEDTW":false,"isNonHistoricalEDTW":false,"isTargetedMsg":false,"isCommodityInfoAvail":false,"isExpiring":false,"CDOInfoList":[{"spclInstructDesc":"","delivOptn":"","delivOptnStatus":"","reqApptWdw":"","reqApptDesc":"","rerouteTRKNbr":"","beginTm":"","endTm":""}],"isCDOEligible":false,"CDOExists":false,"isExclusionReason":false,"isNotFound":false,"isInTransit":false,"isOnSchedule":false,"isDelException":false,"isHAL":false,"isBeforePossessionStatus":false,"isWatch":false,"isOutboundDirection":false,"isInboundDirection":false,"isThirdpartyDirection":false,"isDestResidential":true}],"alerts":null,"cxsalerts":null}}
---JSON

  my $data = $fedex->track('740477193998');
  my $expect = {
    'status' => {
      'description' => 'Delivered: 10/27/2017 10:18 am Signed for by:Signature not required; Belle Plaine, MN; Left at front door.Signature Service not requested. 2017-10-27 10:18:16',
      'date' => '10/27/17',
      'delivered' => 1,
    },
    'destination' => {
        'country' => 'US',
         'address2' => '',
         'city' => 'BELLE PLAINE',
         'postal_code' => '',
         'address1' => '',
         'state' => 'MN'
    },
    'weight' => '',
    'service' => 'FedEx Home Delivery',
    human_url => 'https://www.fedex.com/apps/fedextrack/?action=track&locale=en_US&cntry_code=us&language=english&tracknumbers=740477193998',
  };
  is_deeply $data, $expect, 'parsed data correctly';
};
  
done_testing