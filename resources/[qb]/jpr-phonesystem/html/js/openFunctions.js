function formatMoney(param) {
    var value = new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(parseInt(param))

    return value.replace(/,00/, '');
}

function SearchRowsMDT() {
    var searchText = $("#mdtInput").val()
    if ((DadosTelemovel["Wifi"] == true) || (dadosdasdefs?.dadosmoveis == true && dadosdasdefs?.modovoo == false && DadosTelemovel["Signal"] == true)) {
        $("#semcondicoesmdt").fadeOut(1)
        if (currentInteraction == "citizen") {
            if (inputUsers) {
                var regist = searchInTable(inputUsers, searchText)

                if (regist) {
                    $(".infosMDTPanel span").css({"display":"none"})

                    for (let index = 0; index < regist.length; index++) {
                        const element = regist[index];
        
                        var charinfo = JSON.parse(element.charinfo)
        
                        var image = "male"
                        var gender = charinfo.gender
                        if (gender == 0) {
                            gender = "M"
                        } else {
                            image = "female"
                            gender = "F"
                        }
        
                        var job = JSON.parse(element.job)
                        
                        var mdtInfo = '<div class="infoBoxCitizen">'+
                            '<h1><b>'+Traducoes["174"]+'</b>: '+element.citizenid+'</h1>'+
                            '<h1><b>'+Traducoes["175"]+'</b>: '+charinfo.firstname+'</h1>'+
                            '<h1><b>'+Traducoes["176"]+'</b>: '+charinfo.lastname+'</h1>'+
                            '<h1><b>'+Traducoes["177"]+'</b>: '+charinfo.phone+'</h1>'+
                            '<h1><b>'+Traducoes["178"]+'</b>: '+gender+'</h1>'+
                            '<h1><b>'+Traducoes["179"]+'</b>: '+charinfo.birthdate+'</h1>'+
                            '<h1><b>'+Traducoes["180"]+'</b>: '+job.label+'</h1>'+
                            '<h1><b>'+Traducoes["181"]+'</b>: '+job.grade.name+'</h1>'+
                            '<h1><b>'+Traducoes["182"]+'</b>: '+charinfo.account+'</h1>'+
                            '<img src="./img/mdt/'+image+'.png" alt="mdt">'+
                        '</div>'
        
                        $(".infoBoxMDT").append(mdtInfo);
                    }
                } else {
                    $(".infosMDTPanel span").css({"display":"block"})
                }
            } else {
                $(".infosMDTPanel span").css({"display":"block"})
            }
        } else if (currentInteraction == "vehicles") {
            if (inputHouses) {
                var regist = searchInTable(inputVehicles, searchText)

                if (regist) {
                    $(".infosMDTPanel span").css({"display":"none"})

                    for (let index = 0; index < regist.length; index++) {
                        const element = regist[index];

                        
                        var mdtInfo = '<div class="infoBoxVehicle">'+
                            '<h1><b>'+Traducoes["168"]+'</b>: '+element.citizenid+'</h1>'+
                            '<h1><b>'+Traducoes["173"]+'</b>: '+element.plate+'</h1>'+
                            '<h1><b>'+Traducoes["170"]+'</b>: '+element.fuel+'%</h1>'+
                            '<h1><b>'+Traducoes["171"]+'</b>: '+Math.ceil(element.body / 10)+"%"+'</h1>'+
                            '<h1><b>'+Traducoes["172"]+'</b>: '+Math.ceil(element.engine / 10)+"%"+'</h1>'+
                            '<h1><b>'+Traducoes["165"]+'</b>: '+element.garage+'</h1>'+
                            '<img src="./img/mdt/vehicle.png" alt="mdt">'+
                        '</div>'
        
                        $(".infoBoxMDT").append(mdtInfo);
                    }
                } else {
                    $(".infosMDTPanel span").css({"display":"block"})
                }
            } else {
                $(".infosMDTPanel span").css({"display":"block"})
            }
        } else if (currentInteraction == "houses") {
            if (inputHouses) {
                var regist = searchInTable(inputHouses, searchText)

                if (regist) {
                    $(".infosMDTPanel span").css({"display":"none"})

                    for (let index = 0; index < regist.length; index++) {
                        const element = regist[index];
                        
                        var mdtInfo = '<div class="infoBoxHouses">'+
                            '<h1><b>'+Traducoes["168"]+'</b>: '+element.citizenid+'</h1>'+
                            '<h1><b>'+Traducoes["167"]+'</b>: '+element.label+'</h1>'+
                            '<h1><b>'+Traducoes["166"]+'</b>: '+element.keyholders+'</h1>'+
                            '<h1><b>'+Traducoes["165"]+'</b>: '+element.tier+'</h1>'+
                            '<h1 class="gpsMDT" data-gps="'+index+'"><b>'+Traducoes["169"]+'</b>: <i class="fa-solid fa-location-dot" style="color: rgb(171, 37, 37); cursor: pointer;"></i></h1>'+
                            '<img src="./img/mdt/house.png" alt="mdt">'+
                        '</div>'
        
                        $(".infoBoxMDT").append(mdtInfo);
                        $("[data-gps='" + index + "']").data('MeuMDTGps', element)  
                    }
                } else {
                    $(".infosMDTPanel span").css({"display":"block"})
                }
            } else {
                $(".infosMDTPanel span").css({"display":"block"})
            }
        }
    } else {
        $(".infosMDTPanel span").css({"display":"none"})
        $("#semcondicoesmdt").fadeIn(400)
    }
}