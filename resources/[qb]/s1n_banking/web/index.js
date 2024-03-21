// global variables

let Config = null;
let ClosestPlayers = null;

let activeChart = null;
let currentBankData = null;
let selectedHistoryCategory = null;
let selectedHistoryFilter = null;
let selectedCreditAmount = null;
let selectedCreditDuration = null;

// Extension of Date's prototype

Date.prototype.today = function () {
    return ((this.getDate() < 10) ? '0' : '') + this.getDate() + '/' + (((this.getMonth() + 1) < 10) ? '0' : '') + (this.getMonth() + 1) + '/' + this.getFullYear();
}

Date.prototype.timeNow = function () {
    return ((this.getHours() < 10) ? '0' : '') + this.getHours() + ':' + ((this.getMinutes() < 10) ? '0' : '') + this.getMinutes();
}

function TranslateUI() {
    window.$("#shared_account_exit_cancel").html(Config.Translation.UI_TEXT_CANCEL);
    window.$("#shared_account_exit_confirm").html(Config.Translation.UI_TEXT_CONFIRM);
    window.$("#shared_account_modal_description").html(Config.Translation.UI_TEXT_SHARED_ACCOUNT_MODAL_DESCRIPTION);
    window.$("#shared_account_modal_title").html(Config.Translation.UI_TEXT_SHARED_ACCOUNT_MODAL_TITLE);
}

// Handler of banking transactions

const CreateChart = (deposit, withdraw) => {
    if (activeChart) activeChart.destroy();

    const ctx = document.getElementById('myChart').getContext('2d');
    activeChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['9 ' + Config.Translation.UI_CHART_DAYS, '8 ' + Config.Translation.UI_CHART_DAYS, '7 ' + Config.Translation.UI_CHART_DAYS, '6 ' + Config.Translation.UI_CHART_DAYS, '5 ' + Config.Translation.UI_CHART_DAYS, '4 ' + Config.Translation.UI_CHART_DAYS, '3 ' + Config.Translation.UI_CHART_DAYS, Config.Translation.UI_CHART_YESTERDAY, Config.Translation.UI_CHART_TODAY],
            datasets: [
                {
                    borderColor: '#24DD7A',
                    backgroundColor: 'transparent',
                    data: deposit,
                },
                {
                    borderColor: '#ff8e8e',
                    backgroundColor: 'transparent',
                    data: withdraw,
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    grid: { display: false }
                },
                y: {
                    grid: { color: 'rgba(255, 255, 255, 0.1)' },
                    beginAtZero: true,
                    ticks: {
                        count: 6
                    }
                }
            },
            plugins: { legend: { display: false } }
        }
    });
}

// Handler of the banking page

const OpenBankPage = (data) => {
    currentBankData = data;

    window.$('.loginPage').css('display', 'none');
    window.$('.General').css('display', 'flex');
    window.$('#accountiban').html(data.iban);
    window.$('#accountbalance').html('$' + (data.balance).toLocaleString(Config.Translation.JS_LOCALE_STRING));
    window.$('.creditAmountSelectList').html('');
    window.$('.exitButton').css('display', currentBankData.type === 'sharedaccount' ? 'flex' : 'none');


    Config.Credit.Amounts.forEach(amount => {
        window.$('.creditAmountSelectList').append(`<div class="creditAmountSelect" id="creditamount-${amount}">$${(amount).toLocaleString(Config.Translation.JS_LOCALE_STRING)}</div>`);

        window.$(`#creditamount-${amount}`).on('click', () => {
            window.$('.creditAmountSelect').removeClass('selected');
            window.$(`#creditamount-${amount}`).addClass('selected');
            window.$('#creditwant').html('$' + amount);
            window.$('#credittobank').html('$' + amount);
            window.$('#creditsecurity').html('$' + (Config.Credit.SecurityDeposit / 100) * amount);
            window.$('#creditrepaid').html('$' + (amount + ((Config.Credit.SecurityDeposit / 100) * amount)));
            selectedCreditAmount = amount;
            if (selectedCreditDuration) {
                window.$('.creditRequestTotalBox').css('display', 'flex');
                window.$('.creditRightSide').css('justify-content', 'space-between');
                window.$('.creditRightBottom').css('margin-top', '0px');
            }
        })
    });
    window.$('#creditduration').html('');
    window.$('#creditduration').append(`<option value="" disabled selected>${Config.Translation.UI_TEXT_DURATION}</option>`);
    Config.Credit.Duration.forEach((data, index) => {
        window.$('#creditduration').append(`<option value="${index}">${data.Label}</option>`);
    });
    window.$(`#creditduration`).on('change', (event) => {
        selectedCreditDuration = event.target.value;
        if (selectedCreditAmount) {
            window.$('.creditRequestTotalBox').css('display', 'flex');
            window.$('.creditRightSide').css('justify-content', 'space-between');
            window.$('.creditRightBottom').css('margin-top', '0px');
            let duration = Config.Credit.Duration[selectedCreditDuration];
            let days = duration.Time / 86400;
            if (days <= 7) {
                window.$('#creditamounteach').html(Config.Translation.UI_TEXT_AMOUNT_PAYABLE_EACH_WEEK);
                window.$('#crediteachmonth').html(`${selectedCreditAmount}`);
            } else if (days > 7 && days < 30) {
                window.$('#creditamounteach').html(Config.Translation.UI_TEXT_AMOUNT_PAYABLE_EACH_WEEK);
                window.$('#crediteachmonth').html(`${Math.floor(selectedCreditAmount / Math.floor(days / 7))}<span style="font-weight: 700"> * ${Math.floor(days / 7)}</span>`);
            } else if (days === 30) {
                window.$('#creditamounteach').html(Config.Translation.UI_TEXT_AMOUNT_PAYABLE_EACH_MONTH);
                window.$('#crediteachmonth').html(`${selectedCreditAmount}`);
            } else if (days > 30) {
                window.$('#creditamounteach').html(Config.Translation.UI_TEXT_AMOUNT_PAYABLE_EACH_MONTH);
                window.$('#crediteachmonth').html(`${Math.floor(selectedCreditAmount / Math.floor(days / 30))}<span style="font-weight: 700"> * ${Math.floor(days / 30)}</span>`);
            }
        }
    });
    if (data.type === 'useraccount') {
        window.$('.inviteAccount').css('display', 'none');
        window.$('.settingsRightSide').css('display', 'none');
        window.$('#settingsline').css('display', 'none');
        window.$('.settingsLeftSide').css('justify-content', 'flex-start');
        window.$('.changeIban').css('margin-top', '10px');
        window.$('#headername1').html(Config.Translation.UI_TEXT_PERSONAL);
        window.$('#headername2').html(Config.Translation.UI_TEXT_PERSONAL);
    }
    if (data.type === 'societyaccount') {
        window.$('.inviteAccount').css('display', 'none');
        window.$('.settingsRightSide').css('display', 'none');
        window.$('#settingsline').css('display', 'none');
        window.$('.settingsLeftSide').css('justify-content', 'flex-start');
        window.$('.changeIban').css('margin-top', '10px');
        window.$('#headername1').html(Config.Translation.UI_TEXT_SOCIETY);
        window.$('#headername2').html(Config.Translation.UI_TEXT_SOCIETY);
    }
    if (data.type === 'sharedaccount') {
        window.$('.inviteAccount').css('display', 'flex');
        window.$('.settingsRightSide').css('display', 'flex');
        window.$('#settingsline').css('display', 'flex');
        window.$('.settingsLeftSide').css('justify-content', 'space-between');
        window.$('.changeIban').css('margin-top', '0');
        window.$('#headername1').html(`${Config.Translation.UI_TEXT_SHARED_ACCOUNT} - ${data.name}`);
        window.$('#headername2').html(`${Config.Translation.UI_TEXT_SHARED_ACCOUNT} - ${data.name}`);
        window.$('#sharedaccountmembers').html('');

        if (data.members === undefined || data.members.length === 0) {
            window.$('#sharedaccountmembers').append(`
                <div class="settingsPlayer">
                    <div class="settingsPlayerBoxs">
                        ${Config.Translation.UI_TEXT_NO_PLAYERS_AROUND}
                    </div>
                </div>
            `);
        } else {
            data.members.forEach((member, index) => {
                window.$('#sharedaccountmembers').append(`
                    <div class="settingsPlayer">
                        <div class="settingsPlayerBoxs">
                            ${member.name}
                        </div>
                        <div class="kickButton" id="kickshared-${index}">${Config.Translation.UI_TEXT_KICK}</div>
                    </div>
                `);
                window.$(`#kickshared-${index}`).on('click', () => {
                    window.$.post(`https://${GetParentResourceName()}/kickShared`, JSON.stringify({
                        iban: currentBankData.iban,
                        type: 'sharedaccount',
                        member: member
                    }));
                });
            });
        }
    }
    window.$('.creditRequestTotalBox').css('display', 'none');
    window.$('.creditRightSide').css('justify-content', 'flex-start');
    window.$('.creditRightBottom').css('margin-top', '10px');
    CreateLastTransactions();
    CreateHistoryList();
    CreateChart([data.chart[8].deposit, data.chart[7].deposit, data.chart[6].deposit, data.chart[5].deposit, data.chart[4].deposit, data.chart[3].deposit, data.chart[2].deposit, data.chart[1].deposit, data.chart[0].deposit], [data.chart[8].withdraw, data.chart[7].withdraw, data.chart[6].withdraw, data.chart[5].withdraw, data.chart[4].withdraw, data.chart[3].withdraw, data.chart[2].withdraw, data.chart[1].withdraw, data.chart[0].withdraw]);
}

const UpdateAccountData = (data) => {
    currentBankData = data;
    window.$('#accountiban').html(data.iban);
    window.$('#accountbalance').html('$' + (data.balance).toLocaleString(Config.Translation.JS_LOCALE_STRING));
    if (data.type === 'sharedaccount') {
        window.$('#sharedaccountmembers').html('');
        if (data.members.length === 0) {
            window.$('#sharedaccountmembers').append(`
                <div class="settingsPlayer">
                    <div class="settingsPlayerBoxs">
                        ${Config.Translation.UI_TEXT_NO_PLAYERS_AROUND}
                    </div>
                </div>
            `);
        } else {
            data.members.forEach((member, index) => {
                window.$('#sharedaccountmembers').append(`
                    <div class="settingsPlayer">
                        <div class="settingsPlayerBoxs">
                            ${member.name}
                        </div>
                        <div class="kickButton" id="kickshared-${index}">${Config.Translation.UI_TEXT_KICK}</div>
                    </div>
                `);
                window.$(`#kickshared-${index}`).on('click', () => {
                    window.$.post(`https://${GetParentResourceName()}/kickShared`, JSON.stringify({
                        iban: currentBankData.iban,
                        type: 'sharedaccount',
                        member: member
                    }));
                });
            });
        }
    }
    CreateLastTransactions();
    CreateHistoryList();
    CreateChart([data.chart[8].deposit, data.chart[7].deposit, data.chart[6].deposit, data.chart[5].deposit, data.chart[4].deposit, data.chart[3].deposit, data.chart[2].deposit, data.chart[1].deposit, data.chart[0].deposit], [data.chart[8].withdraw, data.chart[7].withdraw, data.chart[6].withdraw, data.chart[5].withdraw, data.chart[4].withdraw, data.chart[3].withdraw, data.chart[2].withdraw, data.chart[1].withdraw, data.chart[0].withdraw]);
}

const GetTransactionCss = (data) => {
    if (data.action === 'deposit') {
        return ['fa-solid fa-money-bill-transfer', '+', '#2df57e', 'depositIcon', 'depositPrice', 'depositHistoryIconBox'];
    } else if (data.action === 'withdraw') {
        return ['fa-solid fa-money-bill-transfer', '-', '#f56060', 'withdrawIcon', 'withdrawPrice', 'withdrawHistoryIconBox'];
    } else if (data.action === 'credit') {
        return ['fa-solid fa-credit-card', '+', '#00ffe0', 'creditIcon', 'creditPrice', 'creditHistoryIconBox'];
    } else if (data.action === 'transfer') {
        return ['fa-solid fa-right-left', '-', '#84C4FF', 'transferIcon', 'transactionPrice', 'transferHistoryIconBox'];
    }
}

const CreateLastTransactions = () => {
    window.$('#lasttransactions').html('');
    currentBankData.history = currentBankData.history.sort(function (a, b) {
        return new Date(b.date * 1000) - new Date(a.date * 1000);
    });
    for (let index = 0; index < 10; index++) {
        if (currentBankData.history[index]) {
            transaction = currentBankData.history[index];
            let cssData = GetTransactionCss(transaction);
            window.$('#lasttransactions').append(`
                <div class='transaction'>
                    <div class='transactionLeft'>
                        <div class='transactionIcon depositIcon'>
                            <i class='${cssData[0]}'></i>
                        </div>
                        <h2 style='color: ${cssData[2]}'>${transaction.action}</h2>
                    </div>
                    <div class='transactionRight'>
                        <h3 class='transactionInfo'>
                            ${transaction.label}
                            <p>${Config.Translation.UI_TEXT_TRANSACTION}</p>
                        </h3>
                        <h2 style='color: ${cssData[2]}' class='transactionPrice'>${cssData[1]}$${transaction.amount}</h2>
                    </div>
                </div>
            `);
        }
    }
}

const GetDaysDiff = (time) => {
    let date = new Date(time * 1000);
    let now = new Date();
    let diff = now.getTime() - date.getTime();
    let daysDiff = diff / (1000 * 3600 * 24);
    return Math.floor(daysDiff);
}

const CreateHistoryList = () => {
    window.$('#historylist').html('');
    if (selectedHistoryFilter) {
        if (selectedHistoryFilter === 'mostrecent') {
            currentBankData.history = currentBankData.history.sort(function (a, b) {
                return new Date(b.date * 1000) - new Date(a.date * 1000);
            });
        } else {
            currentBankData.history = currentBankData.history.sort(function (a, b) {
                return new Date(a.date * 1000) - new Date(b.date * 1000);
            });
        }
    } else {
        currentBankData.history = currentBankData.history.sort(function (a, b) {
            return new Date(b.date * 1000) - new Date(a.date * 1000);
        });
    }
    for (let index = 0; index < currentBankData.history.length; index++) {
        if (currentBankData.history[index] && (selectedHistoryCategory ? selectedHistoryCategory === currentBankData.history[index].action : true)) {
            transaction = currentBankData.history[index];
            let cssData = GetTransactionCss(transaction);

            if (transaction.action === 'credit') {
                let days = transaction.creditduration / 86400;
                let timeleft = '';

                if (days <= 7) {
                    timeleft = `${Config.Translation.UI_TEXT_TIME_LEFT} <p>1<span>/1 ${Config.Translation.UI_TEXT_WEEK}</span></p>`;
                } else if (days > 7 && days < 30) {
                    timeleft = `${Config.Translation.UI_TEXT_TIME_LEFT} <p>${Math.floor((days - GetDaysDiff(transaction.creditdate)) / 7)}<span>/${Math.floor(days / 7)} ${Config.Translation.UI_TEXT_WEEKS}</span></p>`;
                } else if (days === 30) {
                    timeleft = `${Config.Translation.UI_TEXT_TIME_LEFT} <p>1<span>/1 ${Config.Translation.UI_TEXT_MONTH}</span></p>`;
                } else if (days > 30) {
                    timeleft = `${Config.Translation.UI_TEXT_TIME_LEFT} <p>${Math.floor((days - GetDaysDiff(transaction.creditdate)) / 30)}<span>/${Math.floor(days / 30)} ${Config.Translation.UI_TEXT_WEEKS}</span></p>`;
                }

                window.$('#historylist').append(`
                    <div class="historyBox creditHistory">
                        <div class="historyCreditLeftBox">
                            <div class="historyIconBox ${cssData[5]}">
                                <div class="historyIcon ${cssData[3]}">
                                    <i class='${cssData[0]}'></i>
                                </div>
                                <h2>${transaction.action}</h2>
                            </div>
                            <h2 class="historyCreditLeftTime">${timeleft}</h2>
                            <h2 class="historyCreditAmountPaid">
                                ${Config.Translation.UI_TEXT_AMOUNT_PAID}
                                <p>-$${(Config.Credit.SecurityDeposit / 100) * transaction.creditamount}</p>
                            </h2>
                        </div>
                        <div class="historyRightBox">
                            <h2 class="creditPrice">
                                <p>$${transaction.creditamountpaid}</p>/ $${transaction.creditamount}
                            </h2>
                            <div class='historyDate'>${new Date(transaction.date * 1000).today()} <span>${new Date(transaction.date * 1000).timeNow()}</span></div>
                        </div>
                    </div>
                `);
            } else {
                window.$('#historylist').append(`
                    <div class='historyBox'>
                        <div class='historyLeftBox'>
                            <div class='historyIconBox ${cssData[5]}'>
                                <div class='historyIcon ${cssData[3]}'>
                                    <i class='${cssData[0]}'></i>
                                </div>
                                <h2>${transaction.action}</h2>
                            </div>
                            <h2 class='historyDescription'>
                                ${transaction.label}
                                <p>${Config.Translation.UI_TEXT_TRANSACTION}</p>
                            </h2>
                        </div>
                        <div class='historyRightBox'>
                            <h2 class='historyPrice ${cssData[4]}'>${cssData[1]}$${transaction.amount}</h2>
                            <div class='historyDate'>${new Date(transaction.date * 1000).today()} <span>${new Date(transaction.date * 1000).timeNow()}</span></div>
                        </div>
                    </div>
                `);
            }
        }
    }
}

// Events handlers

window.$(document).ready(function () {

    window.$('#openregisterscreen').on('click', () => {
        window.$('.loginSide').css('display', 'none');
        window.$('.registerSide').css('display', 'flex');
    });

    window.$('#openloginscreen').on('click', () => {
        window.$('.registerSide').css('display', 'none');
        window.$('.loginSide').css('display', 'flex');
    });

    window.$('#firstscreenclose').on('click', () => {
        window.$('.loginPage').css('display', 'none');
        window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    });

    window.$('#loginuseraccount').on('click', () => {
        window.$.post(`https://${GetParentResourceName()}/getAccountData`, JSON.stringify({
            type: 'useraccount'
        }), (result) => {
            if (result) {
                window.$('#scanaccounttype').html(Config.Translation.UI_TEXT_USER_ACCOUNT);
                window.$('#facescanicon').attr('class', 'fa-solid fa-user');
                window.$('.loginSide').css('display', 'none');
                window.$('.scanSide').css('display', 'flex');
                window.$('.facescanarrow').css('display', 'none');
                setTimeout(() => {
                    OpenBankPage(result);
                }, 5000)
            }
        });
    });

    window.$('#loginsocietyaccount').on('click', () => {
        window.$.post(`https://${GetParentResourceName()}/getAccountData`, JSON.stringify({
            type: 'societyaccount'
        }), (result) => {
            if (result) {
                window.$('#scanaccounttype').html(Config.Translation.UI_TEXT_SOCIETY_ACCOUNT);
                window.$('#facescanicon').attr('class', 'fa-solid fa-user-group');
                window.$('.loginSide').css('display', 'none');
                window.$('.scanSide').css('display', 'flex');
                window.$('.facescanarrow').css('display', 'none');
                setTimeout(() => {
                    OpenBankPage(result);
                }, 5000)
            }
        });
    });

    window.$('#loginsharedaccount').on('click', () => {
        window.$.post(`https://${GetParentResourceName()}/getAccountData`, JSON.stringify({
            type: 'sharedaccount'
        }), (result) => {
            if (result) {
                window.$('#scanaccounttype').html('Shared Account');
                window.$('#facescanicon').attr('class', 'fa-solid fa-users');
                window.$('.loginSide').css('display', 'none');
                window.$('.scanSide').css('display', 'flex');
                window.$('.facescanarrow').css('display', 'flex');
                setTimeout(() => {
                    OpenBankPage(result);
                }, 5000)
            }
        });
    });

    window.$('#registeruseraccount').on('click', () => {
        window.$.post(`https://${GetParentResourceName()}/createAccount`, JSON.stringify({
            type: 'useraccount'
        }), (result) => {
            if (result) {
                window.$('#scanaccounttype').html(Config.Translation.UI_TEXT_USER_ACCOUNT);
                window.$('#facescanicon').attr('class', 'fa-solid fa-user');
                window.$('.registerSide').css('display', 'none');
                window.$('.scanSide').css('display', 'flex');
                window.$('.facescanarrow').css('display', 'none');
                setTimeout(() => {
                    window.$('.loginPage').css('display', 'none');
                    window.$.post(`https://${GetParentResourceName()}/getAccountData`, JSON.stringify({
                        type: 'useraccount'
                    }), (result) => {
                        if (result) {
                            OpenBankPage(result);
                        }
                    });
                }, 5000)
            }
        });
    });

    window.$('#registersocietyaccount').on('click', () => {
        window.$.post(`https://${GetParentResourceName()}/createAccount`, JSON.stringify({
            type: 'societyaccount'
        }), (result) => {
            if (result) {
                window.$('#scanaccounttype').html(Config.Translation.UI_TEXT_SOCIETY_ACCOUNT);
                window.$('#facescanicon').attr('class', 'fa-solid fa-user-group');
                window.$('.registerSide').css('display', 'none');
                window.$('.scanSide').css('display', 'flex');
                window.$('.facescanarrow').css('display', 'none');
                setTimeout(() => {
                    window.$('.loginPage').css('display', 'none');
                    window.$.post(`https://${GetParentResourceName()}/getAccountData`, JSON.stringify({
                        type: 'societyaccount'
                    }), (result) => {
                        if (result) {
                            OpenBankPage(result);
                        }
                    });
                }, 5000)
            }
        });
    });

    window.$('#registersharedaccount').on('click', () => {
        window.$('.createPlayerList').html('');
        ClosestPlayers.forEach((player) => {
            window.$('.createPlayerList').append(`
                <div class="settingsInvite">
                    <div class="settingsPlayerBoxs">
                        ${player.name}
                    </div>
                    <div class="inviteButton transferButton" id="invite-${player.id}">${Config.Translation.UI_TEXT_INVITE}</div>
                </div>
            `);
            window.$(`#invite-${player.id}`).on('click', function () {
                window.$.post(`https://${GetParentResourceName()}/sendSharedInvite`, JSON.stringify({
                    id: player.id
                }));
            });
        })
        window.$('.registerSide').css('display', 'none');
        window.$('.createSide').css('display', 'flex');
    });

    window.$('#openhistorypage').on('click', () => {
        window.$('#opencreditpage').removeClass('categorySelect');
        window.$('#openhomepage').removeClass('categorySelect');
        window.$('#opensettingspage').removeClass('categorySelect');
        window.$('#openhistorypage').addClass('categorySelect');
        window.$('.homePage').css('display', 'none');
        window.$('.creditPage').css('display', 'none');
        window.$('.settingsPage').css('display', 'none');
        window.$('.historyPage').css('display', 'flex');
    });

    window.$('#openhomepage').on('click', () => {
        window.$('#openhistorypage').removeClass('categorySelect');
        window.$('#opencreditpage').removeClass('categorySelect');
        window.$('#opensettingspage').removeClass('categorySelect');
        window.$('#openhomepage').addClass('categorySelect');
        window.$('.creditPage').css('display', 'none');
        window.$('.historyPage').css('display', 'none');
        window.$('.settingsPage').css('display', 'none');
        window.$('.homePage').css('display', 'flex');
    });

    window.$('#opencreditpage').on('click', () => {
        window.$('#openhistorypage').removeClass('categorySelect');
        window.$('#openhomepage').removeClass('categorySelect');
        window.$('#opensettingspage').removeClass('categorySelect');
        window.$('#opencreditpage').addClass('categorySelect');
        window.$('.homePage').css('display', 'none');
        window.$('.historyPage').css('display', 'none');
        window.$('.settingsPage').css('display', 'none');
        window.$('.creditPage').css('display', 'flex');
    });

    window.$('#opensettingspage').on('click', () => {
        window.$('#openhistorypage').removeClass('categorySelect');
        window.$('#openhomepage').removeClass('categorySelect');
        window.$('#opencreditpage').removeClass('categorySelect');
        window.$('#opensettingspage').addClass('categorySelect');
        window.$('.homePage').css('display', 'none');
        window.$('.historyPage').css('display', 'none');
        window.$('.creditPage').css('display', 'none');
        window.$('.settingsPage').css('display', 'flex');
    });

    window.$('.exitBox').on('click', () => {
        window.$('.General').css('display', 'none');
        window.$.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    });

    // Close/Quit a shared account
    window.$('.exitButton').on('click', () => {
        window.$('.pop-upBox').css('display', 'flex');
        window.$('#shared_account_exit').css('display', 'flex');
    });

    window.$('#shared_account_exit_confirm').on('click', () => {
        if (currentBankData.type === 'sharedaccount') {
            window.$.post(`https://${GetParentResourceName()}/closeLeaveShared`, JSON.stringify({}));

            window.$('.pop-upBox').css('display', 'none');
            window.$('#shared_account_exit').css('display', 'none');
            window.$('.General').css('display', 'none');
            window.$('.registerSide').css('display', 'none');
            window.$('.createSide').css('display', 'none');
            window.$('.scanSide').css('display', 'none');
            window.$('.loginPage').css('display', 'flex');
            window.$('.loginSide').css('display', 'flex');
        }
    })

    window.$('#shared_account_exit_cancel').on('click', () => {
        window.$('.pop-upBox').css('display', 'none');
        window.$('#shared_account_exit').css('display', 'none');
    })

    // Popups
    window.$('#depositmoney').on('click', () => {
        window.$('.pop-upBox').css('display', 'flex');
        window.$('#moneywithdrawpopup').css('display', 'none');
        window.$('#moneytransferpopup').css('display', 'none');
        window.$('#moneydepositpopup').css('display', 'flex');
    });

    window.$('#withdrawmoney').on('click', () => {
        window.$('.pop-upBox').css('display', 'flex');
        window.$('#moneydepositpopup').css('display', 'none');
        window.$('#moneytransferpopup').css('display', 'none');
        window.$('#moneywithdrawpopup').css('display', 'flex');
    });

    window.$('#transfermoney').on('click', () => {
        window.$('.pop-upBox').css('display', 'flex');
        window.$('#moneydepositpopup').css('display', 'none');
        window.$('#moneywithdrawpopup').css('display', 'none');
        window.$('#moneytransferpopup').css('display', 'flex');
    });

    window.$('.closepopup').on('click', () => {
        window.$('.pop-upBox').css('display', 'none');
        window.$('#moneydepositpopup').css('display', 'none');
        window.$('#moneywithdrawpopup').css('display', 'none');
        window.$('#moneytransferpopup').css('display', 'none');
    });

    window.$('#historycredit').on('click', () => {
        window.$('#historydeposit').removeClass('selected');
        window.$('#historywithdraw').removeClass('selected');
        window.$('#historytransfer').removeClass('selected');
        window.$('#historycredit').addClass('selected');
        if (selectedHistoryCategory === 'credit') {
            selectedHistoryCategory = null;
            window.$('#historycredit').removeClass('selected');
        } else {
            selectedHistoryCategory = 'credit';
        }
        CreateHistoryList();
    });

    window.$('#historydeposit').on('click', () => {
        window.$('#historycredit').removeClass('selected');
        window.$('#historywithdraw').removeClass('selected');
        window.$('#historytransfer').removeClass('selected');
        window.$('#historydeposit').addClass('selected');
        if (selectedHistoryCategory === 'deposit') {
            selectedHistoryCategory = null;
            window.$('#historydeposit').removeClass('selected');
        } else {
            selectedHistoryCategory = 'deposit';
        }
        CreateHistoryList();
    });

    window.$('#historywithdraw').on('click', () => {
        window.$('#historycredit').removeClass('selected');
        window.$('#historydeposit').removeClass('selected');
        window.$('#historytransfer').removeClass('selected');
        window.$('#historywithdraw').addClass('selected');

        if (selectedHistoryCategory === 'withdraw') {
            selectedHistoryCategory = null;
            window.$('#historywithdraw').removeClass('selected');
        } else {
            selectedHistoryCategory = 'withdraw';
        }

        CreateHistoryList();
    });

    window.$('#historytransfer').on('click', () => {
        window.$('#historycredit').removeClass('selected');
        window.$('#historydeposit').removeClass('selected');
        window.$('#historywithdraw').removeClass('selected');
        window.$('#historytransfer').addClass('selected');

        if (selectedHistoryCategory === 'transfer') {
            selectedHistoryCategory = null;
            window.$('#historytransfer').removeClass('selected');
        } else {
            selectedHistoryCategory = 'transfer';
        }

        CreateHistoryList();
    });

    window.$('#openinvitemenu').on('click', () => {
        window.$('.settingsInviteList').html('');
        ClosestPlayers.forEach((player) => {
            window.$('.settingsInviteList').append(`
                <div class="settingsInvite">
                    <div class="settingsPlayerBoxs">
                        ${player.name}
                    </div>
                    <div class="inviteButton transferButton" id="settingsinvite-${player.id}">${Config.Translation.UI_TEXT_INVITE}</div>
                </div>
            `);
            window.$(`#settingsinvite-${player.id}`).on('click', function () {
                window.$.post(`https://${GetParentResourceName()}/sendSharedInvite`, JSON.stringify({
                    id: player.id
                }));
            });
        })
        window.$('.settingsInvitePop-up').css('display', 'flex');
    });

    window.$('#closeinvitemenu').on('click', () => {
        window.$('.settingsInvitePop-up').css('display', 'none');
    });

    window.$('#depositaccept').on('click', () => {
        if (!window.$('#depositinput').val()) return;
        window.$.post(`https://${GetParentResourceName()}/accountAction`, JSON.stringify({
            action: 'deposit',
            type: currentBankData.type,
            amount: window.$('#depositinput').val()
        }), function (error) {
            if (!error) {
                window.$('.pop-upBox').css('display', 'none');
                window.$('#moneydepositpopup').css('display', 'none');
                window.$('#depositinput').val('');
            }
        });
    });

    window.$('#withdrawaccept').on('click', () => {
        if (!window.$('#withdrawinput').val()) return;
        window.$.post(`https://${GetParentResourceName()}/accountAction`, JSON.stringify({
            action: 'withdraw',
            type: currentBankData.type,
            amount: window.$('#withdrawinput').val()
        }), function (error) {
            if (!error) {
                window.$('.pop-upBox').css('display', 'none');
                window.$('#moneywithdrawpopup').css('display', 'none');
                window.$('#withdrawinput').val('');
            }
        });
    });

    window.$('.historymodern-select').on('change', (event) => {
        selectedHistoryFilter = event.target.value;
        CreateHistoryList();
    });

    window.$('#confirmchangeiban').on('click', () => {
        if (!window.$('#changeibaninput').val() || window.$('#changeibaninput').val().length > 10) return;
        window.$.post(`https://${GetParentResourceName()}/changeIban`, JSON.stringify({
            type: currentBankData.type,
            iban: window.$('#changeibaninput').val()
        }), function (result) {
            if (result) window.$('#changeibaninput').val('');
        });
    });

    window.$('.createButton').on('click', () => {
        if (!window.$('#sharedaccountname').val()) return;
        window.$.post(`https://${GetParentResourceName()}/createAccount`, JSON.stringify({
            type: 'sharedaccount',
            name: window.$('#sharedaccountname').val()
        }), (result) => {
            if (result) {
                window.$('#scanaccounttype').html(Config.Translation.UI_TEXT_SHARED_ACCOUNT);
                window.$('#facescanicon').attr('class', 'fa-solid fa-users');
                window.$('.createSide').css('display', 'none');
                window.$('.registerSide').css('display', 'none');
                window.$('.scanSide').css('display', 'flex');
                window.$('.facescanarrow').css('display', 'none');
                setTimeout(() => {
                    window.$('.loginPage').css('display', 'none');
                    window.$.post(`https://${GetParentResourceName()}/getAccountData`, JSON.stringify({
                        type: 'sharedaccount'
                    }), (result) => {
                        if (result) {
                            OpenBankPage(result);
                        }
                    });
                }, 5000)
            }
        });
    });

    window.$('#creditamountinput').on('input', () => {
        let amount = parseInt(window.$('#creditamountinput').val());
        if (!amount) {
            selectedCreditAmount = null;
            window.$('.creditRequestTotalBox').css('display', 'none');
            window.$('.creditRightSide').css('justify-content', 'flex-start');
            window.$('.creditRightBottom').css('margin-top', '10px');
        } else {
            window.$('.creditAmountSelect').removeClass('selected');
            window.$(`#creditamount-${amount}`).addClass('selected');
            window.$('#creditwant').html('$' + amount);
            window.$('#credittobank').html('$' + amount);
            window.$('#creditsecurity').html('$' + (Config.Credit.SecurityDeposit / 100) * amount);
            window.$('#creditrepaid').html('$' + (amount + ((Config.Credit.SecurityDeposit / 100) * amount)));
            selectedCreditAmount = amount;
            if (selectedCreditDuration) {
                window.$('.creditRequestTotalBox').css('display', 'flex');
                window.$('.creditRightSide').css('justify-content', 'space-between');
                window.$('.creditRightBottom').css('margin-top', '0px');
            }
        }
    });

    window.$('.signContractButton').on('click', () => {
        if (!selectedCreditAmount) return;
        if (!selectedCreditDuration) return;

        window.$.post(`https://${GetParentResourceName()}/signContract`, JSON.stringify({
            type: currentBankData.type,
            amount: selectedCreditAmount,
            duration: selectedCreditDuration
        }), (error) => {
            if (!error) {
                selectedCreditAmount = null;
                selectedCreditDuration = null;

                window.$('.creditAmountSelect').removeClass('selected');
                window.$('.creditRequestTotalBox').css('display', 'none');
                window.$('.creditRightSide').css('justify-content', 'flex-start');
                window.$('.creditRightBottom').css('margin-top', '10px');
                window.$('#creditamountinput').val('');
                window.$('#creditduration').html('');
                window.$('#creditduration').append(`<option value="" disabled selected>${Config.Translation.UI_TEXT_DURATION}</option>`);

                Config.Credit.Duration.forEach((data, index) => {
                    window.$('#creditduration').append(`<option value="${index}">${data.Label}</option>`);
                });

            }
        });
    });

    window.$('#transfermoneyconfirm').on('click', () => {
        let id = window.$('#transferid').val();
        let amount = window.$('#transferamount').val();

        if (!id || !amount) return;

        window.$.post(`https://${GetParentResourceName()}/accountAction`, JSON.stringify({
            action: 'transfer',
            type: currentBankData.type,
            amount: amount,
            id: id
        }), function (error) {
            if (!error) {
                window.$('.pop-upBox').css('display', 'none');
                window.$('#moneytransferpopup').css('display', 'none');
                window.$('#transferid').val('');
                window.$('#transferamount').val('');
            }
        });
    });

    window.addEventListener('message', event => {
        switch (event.data.type) {
            case 'UpdateAccount':
                UpdateAccountData(event.data.data);
                break;
            case 'OpenBank':
                // console.log("event received: OpenBank")


                window.$('.registerSide').css('display', 'none');
                window.$('.createSide').css('display', 'none');
                window.$('.scanSide').css('display', 'none');
                window.$('.loginPage').css('display', 'flex');
                window.$('.loginSide').css('display', 'flex');

                Config = event.data.config;
                TranslateUI();

                ClosestPlayers = event.data.closestPlayers;
                break;
        }
    });
});