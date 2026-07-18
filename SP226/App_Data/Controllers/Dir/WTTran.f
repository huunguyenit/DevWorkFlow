<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandCheckUnderZeroStock4Transfer SYSTEM "..\Include\Command\CheckUnderZeroStock4Transfer.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY SiteCheck SYSTEM "..\Include\Command\SiteCheck.txt">

  <!ENTITY CheckDataCondition "stt_rec = @stt_rec and sl_ss &lt;&gt; 0">
  <!ENTITY CheckDataBeforeEdit SYSTEM "..\Include\Command\CheckDataBeforeEdit.txt">
  <!ENTITY CheckDataBeforeDelete SYSTEM "..\Include\Command\CheckDataBeforeDelete.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % CRP SYSTEM "..\Include\CRP.ent">
  %CRP;

  <!ENTITY DetailVariable "@d65">
  <!ENTITY DetailStockType "1">
  <!ENTITY DetailTable "d65$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "
declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "
declare @post bit
select @post = case when @status = 0 then 0 else 1 end">


  
  <!ENTITY UpdateCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU4SbipKxGkQLhVEVmO0YJml/S+KFM7rnyA3BMcQez5PyDav8rUBrr0KxI6aKu0kGKuKkutPJYPeQOQgZgm4kMCScy0eQI+unKeS8RRAShUXPhh23My53h8KD0KLm454LFAm0Z9mGT4C3md5Qpk+506KgJ+85mMM/0JjbqNGli22KaTaAOm+WbpCNKdMKaW3vRP6lB/7Ubxv9ntZeGOXhoxIFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kpdQYypT21op6s1xs1oCwb3QzoxaXRlfxrdYxln6yfQ1AHYozmRtEhwYk4kjHU9kLx+L8xM4Tki3oowaUf3nCdW20KKU862Vo2pp/PZmqwFDag2OJGNDjaLJJSVn7r7Up2rPkSQG2ffZVGZORA5xzn8nQe+OFb7yJAZev1u4BfvtvFxutI3cnVPkOkGGRGabu7FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$nNk8dUe86ilcR4y336bXqTUSy7ktjjXN/aKikpyVpm7szdFZrsSj+JSjypuECGDmff20wV5bbwT9hz31GAHZHbkFdFiiF5mNFUjcPNjlJlQak8E888BE9ND2TBOc+zrQFFp1wIXM9IapijjmoHWeDMyL+IOMrA+TK4iREiX0Wp0ekDofhrJaKv27/UkWE/Yy6YAludY6BOekJlk/uq0GwQ==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$nNk8dUe86ilcR4y336bXqfFgqZPJCv2wE3M0sdmtcpPzotoy/o80LW6BmVn4YXuLwQJHvLCvukcrP5myWKP98j0G59NEi+qX3f7gFvwgdwRt3MrcGvcsEVtMnN6D7Vl+j37FjF435Q20skkx9bp+MDSHG8xLWaDuH3HAkYp5UMcNv4StM4rOdul8dacjKOdmEmLpuD1gIfa3eYfdtT7cSq6ze2eGRl7o9y9mY2on1QKv/t5R/obKgaKXGjrNC7PHVmMlCEsrIas7zsqLNig4LOhExJS7AyRVpkzvfj6QsSNx+4fNR7n3I6WNmdx351nnbAYbjf70pbEtWOkatdSBiwmMJb/rO7l4IeMacnE0u0+SJa6WkIP8PKk2c6I3CFID6D3fXZPck7xOZ+b2sttrfQ==FastBusiness.Encryption.End">

  <!ENTITY ReviseCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuyng3w/X3X9PV9tpzg3z+nTB/M8myVIlemCfTMJHqNrBB3xmSlVwh6zgY6h5OrlcIQ/llzEq67kkCtDm2g+nxVmwXXDYWgGCJ1jgSh2GW+U+i3QRgDXGQ9DpRgqdof2mgdAZo1EnEqbDPoE71nf0QVEVcL1pPNHVS3Pw9cvm7rcRFCdixD6+zzOavmt0aBz/B1UUoZmNol4vfDMWlQdtj532z7PiS2F/ny39W2iDCvL4FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22ekrIdtb9alTFFkoHtcVWrsF6qDrc7M9y9LWxFc5q537zgXmASst7/ahOpgvmQihT/4mEXZ3t8qCzIW+hiMJxtgHAFNC0zahLyWXglLF5XnMGarBwpNRLzHiD4bJT7DBcX2q0IETAReEbqcV53539wyAjUpBWz8LhL09Vl3ViDgLDz6N6vqqVdTB+fX7YirvXWG4Gt4zt5jMcMsAZBwImU0IegjkD+TaolGgmwyeGFWAFastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNK4m69qtOF5F07B8DmvtehsQ5CBejcKOQFiGwXJfBMbzDvEjngxgmCfqNP6oLRxn3r9ZVAUF1cvhqetrBE35/QHMeoGd/OQrkUEDZ/Z5lKTBJKqpVqUlsFmo3fSeFrHLYG9E/2d0E5I2qPFInF+TttRtXInVquusSAce7dmXB2mfCBP2XSFpDInzuE5xwoBFnw2H3cBE7NFbmmLGH44Rfho=FastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNK4m69qtOF5F07B8DmvtehsQ5CBejcKOQFiGwXJfBMbz/4wj1RXhSwHdN2Rzk85pzKqwMwQfahycWoONwNlgkdzxbnm6m3NJCTZ6NZ6L3cSK8MIQx2/ET+cM7uRsnOg8xXNFDHVh+q1Gfy71wkvuoADzr15CgroQ17n0E8BOtWwHdd3jzqRUEaegISmq0pzkrbD1mPgmk6dPSnSeNKbFHY5MAQgOcYYSbwM2+tZ/5IoXSKuPICSAT4ndaZFUlfJigQ+QX4io8I9NrE8M/+AoQcJKlsQ7nCxt8ZvdG1Wj4YydFJG/uV9WZz3cYiWDHzeTJl+FZJRkjVQX+8SsuqPocVnFthkdcYso9rh0r7gerWJ8Cp/FMwgFXbaFa4mMMJ0gxKYP2UTaZHwuY/6EblSfIjY=FastBusiness.Encryption.End">

  <!ENTITY DeleteCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU5s5yR5rH2Scw4mgTStQ8fo/Hz79HBlPyjBrB0IYTN2yvq7PCsz69GjcODyO3rmgEvqK+WpSeauXln6XSUhim8lORVGC3gy7rqm5pQcF85d2s4/tG/YLrURQDUyF+UnnHALXdY1cPYqV0K0ob8to8/H2D3bmFGyhobuRcFrCWYyBvDN33MzUVhUA6IvGjI83Swf6MhZag6QE5x4EFXLjYZ4Xlktz/cKR/7w6ux/O+vGkIuq4Zc3YDS1+XlL7yS3BFnwMc2NfwqeFJUu34BrPITr231cjWnXARK9nDuLuUgQwfJtVy0WT26bc9zCloNrDzA8MJ3DDh2SwQr8Dydldul4wsG6UJdygkMr7ogDBSCldAoA5cucK9wzi0rSwFqWSAgfm7oBwhZ1Gsj37t9pgTOkeiGVLE0Ty723XTebls40pw==FastBusiness.Encryption.End">

  <!ENTITY CommandWhenBeforeProcess "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbizbgOPt4KCg/UoJsgbLBnc4u56ES5g5Nuwo8FKpOUzce30vo+lTjRFcNhFty15ZcbxbToVZDLz5pPu/tFFpBdXMA0z9F5eXiWBblzCxjPqYZr8tEWMWz2/zKmCou06WslMCVpzVcX9ahkuWWfcxfPv/e9P8J8LZqSfcS9a12EQY+tLh6eTu4WmTcuZD/Q8+nXa76TwrDSPuHVyMmsLikf+v6aDD2ducz7Iv47v2ZZO32vd7YzpbTABfM7tUu+IPGzyFRV3UiAo7+PLKeUg8TXl4fHCrysOsM72uMBQedihXoG65O01zN1FtlkrWS1mxyfK7yN2CMShbgYqceyY9pM7MWGZWL57IKOaHvyEd9KifzxN38v4naiMVeQwIUS4B/FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbidY+b0e6umF3sbBUccQbGj3T448jO0uKy4dm0XOcP87dOvVenqs2Vmwgio/YhyKIQhNF7uFwdVmcj6zkp52l78Yi2jaK5q+9Nbqavpy+PzknBfb3lI3rfr3SON5laf/b9+bEt3Z3HvkAMS6SiXJCuAoqQwJCbR5bweOTXdVhEqSoFastBusiness.Encryption.End">

  <!ENTITY f1 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11YyySZqScJgrCBFxByOV/cCyS0PjKtChSPp9kD8vev1YZ0ZnYGhUUAX62GXZ0sy5N+7NDCYD3aFA67T55K0T/8KndVVB82EM31Sn3QTaVSzWw==FastBusiness.Encryption.End">
  <!ENTITY f2 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11ZoMRRFgLZNlhPUFrYopuezRmE/f+wOtM3FOoCv1+RkM1ibWHgLCq2D5mWYUP+EPSD4MEIs42c6ttVKlxOd6HpLPEatanNPUf0FI/RBigG99Q==FastBusiness.Encryption.End">

  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/TPnr3f2MZJDMowbF9isD1ZLZAzbfBK+gVRLGXPySmkOAc82Of72YVsLolAkxqiEJa53sLfSqHXrz85plivSNvfMv2Ay8GPcUAsjGQeDglW6A=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5dqg8kMGagySyQcjBxgDJhq7MM4/ar7ckjLuPz2WoHQ7USX2paclbL0YC8La30DyKwftQH93iGodw2eOuwAGszSxtUDFCGqeaCQMif5D8Vb2E=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCVwM3bm3Thaqx779tiYavsWUt0RPxRoyclwh0oDpGa0vFTpliYKujg3TO2Li1HS2pMJuFWnaFUV3jxv4qJ5iTWVUvS/zekNMBFuEMzBZoK7E=FastBusiness.Encryption.End">
  <!ENTITY Check "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcCluc8DSbPkevjpIKfdwSBXHjkjvu5DNJA8PI8jDptpfFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx87NGVe+14s2oYsri81O+8/Ic5p9VHXxIOdfU8dmo5s5CxTMqiotBqNS+eyIrcsdC+OGf/1CUcCKb6T+OI3vE3ej0np7iGmYtZjVx2fbFBbLu5Bp/tkLahpl10AoA7J3FPnGuO9W1UXLXHqmvR5LVlbDybFVKOqKYGkPZrkfPMrhLeN7FpXoFNZGZ1kcfVhv2zfCg5YAijibX19JBz87g+kMuMFAkZR4a/jrTIn6XwO/pJeWaxN9owEDbvO32pGZS8+8PZvRrcR2HXt4MjCw91M9q2twtkJA0JCH/zlh1qyp5K/SLZJ+3YXAj4VWZUPOyDRZQyQhwhEI1d0M5fCo6qmUiDc6Gxmt/kTwVkXI5aoLYgdjWZP3Ak5hpDLFyJrG2jFQt3F6yLWttpKYG7dxZyGh+lslxTQRoNN7rNsPexQd1yWoqITBdRPwJWr+jf7Jvp43IKQ7MnBzzfRUNhlLuSerafI0EY2lLt9HtVxMEJdAYO77dBFn94Qg7PWxaRbZRToyX7E2AYWbfKo8XR9jeSLys8DHKwkzKXFE0amT/o10FastBusiness.Encryption.End">
  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4T2wrucOP+hyVp0C9pW+pWgmEmfHV9Bbw4RbpsyY2zKP8J0TFomTlEopARPOeF/gfT9bDnatRSfNeUcFp5NfKm+hTvCuVRY27YbaGIn8MsidRdy6ajzGk3UmZip4k1sIEWqBDQoSdK2eHOmVmFmnFvLAendqSrm94HQJYGVRxeUIWzDVh4613yzB74by1MrCdDartF0qIFul817BQAhZFefl+0HY9ewow8feggLNLFuFlmE6970k/r8X10wMXOLm05SE88CBGkOUD2TFNFw5wwZQrdNq0XwvkP9UUZ2owrPmZYSNY1khQKbQn7qcXYklSyMN7SD9L+tKHcGTlMO51Hn4jItVgCtkuV/FWtgiOQLUUzT2y+rK3S5BPwJbyPcSomyuRJFeqdoNGUHpPLZy0u9x2cE29HQzZb9cbUf8LHDlJAxNc9Q2/pKs7ef+YiMs1PIpG2iUP5Me0oOhaCQ4gbhy1mvOAN9i0mPT4dNAl3bm+wui/wIpPSR/o72HRzx3/tyQEJDm08hGWAFnp6T3onp4IZTvBeRf1U6ADjSXypBTiG71GIRkm0S2yXmDbH3Jo6rmnkuHDFo2+rRaXK6hR/WB4FVIUB4MtCAJnXq5veyM5aFbQeFUAIypNrToLUaYxjAjtUbDXAsygAWoyzvKMq/ksMWRlkJ1KwqINofAz/q5NHKyf7yM64zKx7I2VaQtK3bBGdK5Ka/otgCaHKAGfJPsv/3nQGM0mXjUn8d0/tTDPBCWXEUCqnTqQ9cwSY3uQdVapxP0WdFiU6A/Yd3Z7xiDDuBOmtVhcrSyKZ1sUPWLuoByevMn+qxZTyIYPok6+DNPpg0ZrDhEMxFifguYOtm5pV+n/Nd6BHF5DE34VP+fgIaXQb7YUcXF2to1cnz+W8LrrsSHKathVhLMpW+smhnf1Gz+kSLFdtL0MQrpfuAfVuq+yfIEuN/GSVOf1yiLDJs04XT8iqmNOZom+8xQwgaHJiE/jArzJ83z4EwsdWQUFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4TrRBgp++BFuLAZiVrbzKD3lMSy7ymglimvPsJkH7SLSLQyYDEKD/Z1dCRZhutP0l0awmMOHhLN0B1x1J8fpP0+qlQtYrhllMy4602i2bcl+w3XB8nTE825/zPeVHyA6X9z2er6RGu7jfteVigB//XI=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5pelLSjJRhAtd224Ny7f3LSi1h5dEhX/M5GtCjwAJ3k024cTqj7cjFsbtjReDGyXVyDmEdynFUvJhXa/XwuU7I=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaWsIalv8YvjvDWuRgNxNNkpPt42KKoufCvfHK8pMGhN/D++aCIQcQl7MDMp65omyoztaJwbS4KE2Xgr2gzm+AG/STZhpWF+Pf9lth93SodWWg==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsRImomVT2hriNrratcT+tPWI2okEpwye7BNQdboStzaA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzURba6pvP8MlYEDCzFCdhHThUsB9WXU68sLyGrczilId2yr+2MKja1wgrzU/LG0mmYC9v5nhqzhbqoP+HKm9DJI0=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Qz71in63+YY5xldsNT7zup0V+bCjzFmHgI6sjlUOr/udTB9U7X1h8zA6xfxUBRFepa2xibn4mNJgUbJP17rhCZMfvBlzDUlknpZWaQI1HgFFastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4bQXjdhq6io7x3FtfM/8dVtwsOQh9EDPLWTpoU99D2towduVzDmc0uWxQ5S2xVk5hDFcQW9qRcTF+ZOtSbDDQ76nHB+6JAQh0sIXlH6nBsXkFastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fSpQb6chtg+oGVtuhFZOqiVFoP14IeGzvNbmcTeXlgRQ1qJ+xS3ZRjCtW6t8j17ODmYRh/I2l+1/ZkKUuKWopfd8YyWq+tAPboIkPPaT6rD1fEVT63cTRMGTNtBUh0u0KUh8TXJPY7peLB8JtW7TVE=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Qz71in63+YY5xldsNT7zuog7ZnjSOW0NcJoPmhTK+DfaPoZnY8a49kbH7dKDwq0sxRtF0aKoDaPDey9Kj5LPjseFKG4KreOvbOOfkEwtEX7FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4bQXjdhq6io7x3FtfM/8dVv7Deb7WJlLgG1+YDydeemuM16iO9Eo7EimQ82SdJFPQvS186Gp0dB0APFYngOJ1jxzcT+CCgVB5Y3K5KRURMPFFastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22fakWddQ75q0S6i+Veg/RyY=FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.WTTran;
  %Extender.Ignore;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m65$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXI" type="Voucher" uniKey="true" replication="2" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu xuất điều chuyển" e="Goods Transfer"></title>
  <partition table="c65$000000" prime="m65$" inquiry="i65$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" allowNulls="false">
      <header v="Mã kho xuất" e="Source Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status = '1' and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" information="ma_kho$dmkho.ten_kho%l" row ="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7r9PWtibxLk8FBwbwjcaWU5esFmeYM5HBpU/fTtqlVpQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_khon" allowNulls="false">
      <header v="Mã kho nhập" e="Destination Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_khon%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and status = '1' and (('{$%c[so_buoc]}' = '2') or (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)))" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and (('{$%c[so_buoc]}' = '2') or (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)))" information="ma_kho$dmkho.ten_kho%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6fK61O07/6MveXVCFls/BjlkcbKBxOgPY+PUL+nLbrk2LrLDGZd+Y5+vU0MyXn2tY=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_khon%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận" e="Recipient"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="3">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id&CRPLookup; and status = '1'" check="ma_ct = @@id&CRPLookup;" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu xuất" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Điều chuyển" e="1. Transfer"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d65" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WTDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="so_buoc" dataFormatString="1, 2" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Số bước (1/2)" e="Step (1/2)"></header>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5WRgplisf0nkrhdlc3BDmc82mIWeoJdlaphB24qDcLhw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền nt" e="Total FC"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
    <field name="vi_trin_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = ma_khon) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="6" split="8">
      <item value="100, 50, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="1101000-1001-11: [ma_kho].Label, [ma_kho], [ten_kho%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1101000-1001--1: [ma_khon].Label, [ma_khon], [ten_khon%l], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="110-000-1101--1: [ong_ba].Label, [ong_ba], [ty_gia].Label, [ma_nt], [ty_gia], [vi_tri_yn]"/>
      <item value="1101000-1100--1: [ma_gd].Label, [ma_gd], [ten_gd%l], [status].Label, [status], [vi_trin_yn]"/>
      <item value="1100000------11: [dien_giai].Label, [dien_giai], [ma_dvcs], [cookie]"/>
      <item value="1: [d65]"/>

      &ListView;
      &PostView;

      <item value="11---101-10-1--: [so_buoc].Label, [so_buoc], [t_tien].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 20, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="4">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenBeforeProcess;
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CheckDataBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandWhenBeforeProcess;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CheckDataBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Fi3AvPh0m+IRW6MxNXBU/irBnSLDSDdUuRk/YbQIOmAvZlyyNAF5I7ut/rzs6pN8wLwNwtN9kaKRZ+w7j0aq7X4CjPI11kdvHfEWeeuYXNkP3bd0gNB0OvOi0nl8yjqg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05p7W0ruORmEPEL9GtjcKlCQX3PTRgwhUiK6gqQUbZVhEBOKFdUVP5fTHlV5ZDDIBiUN/IVlLxoSmTngO+UUMGQj5rTJD8POXsVMgF1RtUK2wOGiaWqaCmaOr0KvHWRl9nW4T+Yid+LcpHVuO2cJO7kpyCzoDEy+oUkeaf2lLNLXi9DiTdYMS11GRQa4lD+BEfQeNgOCkjtN6XhsmWOUhiBZ+iSLFFjzL1oXikJX+jwQ</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGuKTeynFegdOUv6WDwQUeqyQYKSpjhYp4Lq56BJBkioxkDS40eMVfRHGQ1oqVsHVywAU2WZjP5l6hZ99TLeaKwulEJ+HkPMkQBoLeVoFilVWtEMaX0uPdpoHR3LAjVGR94GDVbHlvVLOAw9c+5vKfY=</Encrypted>]]>
        &CommandExternalFieldQuery;&f1;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cTEHAvAq+gidm2OBN9//gNVUzdu3lS5K0TZLicy8jdiuwaK0d2TwdpGtvZaJT9HuTJ+hHcQQEYmItH0EgxLzrOFd3Qmnm4s71oA9/8wuEQW3WRdvqgrl5+/hnTMIEa7gQ==</Encrypted>]]>
        &CommandExternalFieldQuery;&f2;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4W1wGbXQ6xMfLkbLPE7/I5V8MSMwQBHicTBEufSMh6y2</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckUnderZeroStock4Transfer;
        &Check;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsloxUP3b6MAnMnr/iUheqFUHKUW8vfUJB6rB0ekp3mfUruVJs08Wthnyn39p0VT3z2m0AQnrwRHTCblWo2xi90Ly6dk1NYvTxf84vxj8p4rgA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJHeZONlA5s3VtqupiDmvG/jj7GOF3y22p9pYxCKSkdwuCZg+yfyhu9OW9yCBkMM6hirmBQBU6lW/lIyQKXrSXM=</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckUnderZeroStock4Transfer;
        &VoucherWhenBeforeUpdateLog;
        &VoucherWhenBeforeUpdateLogWTTran;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbizbgOPt4KCg/UoJsgbLBnc4u56ES5g5Nuwo8FKpOUzce30vo+lTjRFcNhFty15ZcbxbToVZDLz5pPu/tFFpBdXMA0z9F5eXiWBblzCxjPqYZr8tEWMWz2/zKmCou06WslMCVpzVcX9ahkuWWfcxfPv/e9P8J8LZqSfcS9a12EQY+tLh6eTu4WmTcuZD/Q8+nXa76TwrDSPuHVyMmsLikf+v6aDD2ducz7Iv47v2ZZO32vd7YzpbTABfM7tUu+IPG7VtuoYC6vyY3K3zGGrOvAYDZdfGEH0BBJZpM6Vg3ZBUShocmhWt+uB5/eYcBwE8JimKc/2s24sapFIJV+RqAU9GGqrm4w/Cs6yiNavJymp3tOOn9S5RxpKLQ0eme0xCHQjHuQEampJzC+DepScfI8MQIQD9caiqaX6gmYOpXdvjk6ZQfYdP+1hUG0bZoNxrU</Encrypted>]]>
        &Check;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku6mQYPYj5UWwMvv3ASosEa9G20IITYj8PUQ4zQEfXC7LwGN9hwVo3GyT+OUMo03jWw8t1lLo9JCT6k3KonVIEseXSMfpeS9KDNqqc+ih1THKA/enCvQZjiHUpgwkQEU6e5fluNNHuihTCscO4Xz76144Hl/0o0oGnzA9AF1sk/+fCMk4PE+KVWtlILd/Yz3f9wnfL71jbf0iB26IPuOzdJfvMunQosYmg41hBfWMiw9OMqudfayjaYHUVz5POW7w3zXPNpwlMRLmq0nRdEjErlc2VkSS2S19HV/fODGR1g6T7V5Y7oDDSsZSVgSydkjh8AkborJ6OR4NuZgg7zX74MMnj86pQQyXMZGPQY7B6uNobcMsrKPcVtCwBBfgzkWuLw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WKAFa5eMue1Nes0IYUE7veeJLxabBifl2XV2jC2Na6SX1WI46CkyXydFkNFu7O4MLoZRX+jPry+bVCk5ypkQRpdBk0rS+9QM0M4kdP0v8kraOng7TsZYSU3Hp+x/8UUg4beNUeIp9LM9shELQc+UsDF3vBzBwiolHieBqRBfNrbU2+9/rQ0A73YYtP+gSwLODlsA1MPzbXc9wwCxdqNYmrvQPFdalPBkr/ZcYg6AtTI</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyHVMBix4Ih+UKCBLK0Dpv6xu+lLv8pmtkkl1UjfmRMNIeFIGLwaocHJk5RpeGyLlq8A/jjrBOAuKoGEv/IyzyNs</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CheckDataBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5yE3oWgnls18inR3g88tder/Ca9VCtECDRg6joH8dGsJsp5czhvhOJ6B52bz2NkcJKIXSx9inhLvR4eipTMvISahH6btRC2+rVS9whLjgtFWdId/YEyE1IRU/0jz/1cvKZadMCILs/uw6vUYnGPj0BxxqrqKOs7quxTVCTJcE0QcQBNSLdo3XhIYwDm0lnEzL5/xB+XJLtFw3eIYbpMtESOs04sc7Cn6VI+5F14CoMsXMbgwxLT+JtBiaYkQATroenjrSM6unKxL2HNYXQPdij4bFx4WByKn3Te2nnD8E0mMMctqlZkID7TKbscODsDz/I+nPfZrdSYjJamLLUjD11hrRmrlvG5fDWRouCOq1ZJDBA+OcU9VxB/3XnEmFFY0BV2LycVvKVjxXXLskASNHmdmtGScUl1TSFWFXv52b6zlnN7hgr7vvka3Suo5eAKlJfy+SEh5z9duvoGoWhzvDqmg6n7mZtjMOZA7sIYVPJVb3l2jkWtrlDgNp2meBCMknQ5F8ygGUoqSFplkXj2fQ8=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuynnnI0Q0BESEPZetFhQWtkuaKysAZZ1ev576vrS1r929lUIbhbfA7Bc6I5S7Esh2Nl0A3iIEev/5/9YWZ4GFDI=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rOPfSgWFk6buYBlAkpY91BHMd0eaVC6HSpoOnMuVRttOtKhrpv9PNExHc55Mhu4l07oLLx2yQjqgZTFDTHaYbwvRPQODPc49zwnfJn73pXu5h6dUMtzgTPQMjc62Nelp1AyD5LlLgHBVDEZhU89DId7bMFq9pwJjbjSeRPAWWM9niusN7oy0oJoEbHu6vaWQNU=</Encrypted>]]>
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxe/WQx+bwj5afl4LxyYsF4eKMEdCxPhxtomJzmEROI9VJoZG9bNH0nHvjy16JbbmyP9jXnItVIxywy9UPPnySjdCissWYYP5ulb3T9YJQn5wg==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&lWnqTZZnbWWHJm+kKbHLt+gQWQuWIWxMmdY5SLklkUpFCjEbgk8WVWFRoJlHyDDXMiLKZX7yQwYDJfUbA9A+feHscLph8K6aD8Ec3YovWw5Yrc8LI3PCyevKN41KJMi2asbL1syXoC+eWm1hqEtWgj5eeaPx6S/ac7LqPrDUy/c=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez3bd6vHpP3v8SF6KDL+rfjlxnvA8uuRJg79hFQPJOJmERBWiNa18fYb9apd/2WWrKkX/AwOUERRdTY9pUd1eHeAbEkKljSUVb14DWYqhFMNwIyYnqcAl2i1QS/NzWfrOATu//xLhPQtiwaKZ4IBlNR8OqJeATto6iYG1TTnOyMT50S+Z6XQFvIdkOeIFpQS5Q</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbFlReSjmuryEWo6FEpk73bXyzlYT1xx3QYuv9KIYr8KhIOkiFoGLreH0MrGXkUwrMCsG80DfCphLEe41YwZgmx5DNOQTRBQZo753Hq7JubD3jMIdWu6tEZM1LsL7iuQ9ug2rRo+b9aEJCmw4cO7ExmPyzhn9CIYzi3yBTDOtpY/6hiKhZpQ1Fv0uIM/2uibA/oLaYbgE7VzemBgOhH08hIyhwO9LQxG/40h8N9R0nOde+6gBRUjCb7aqKZm/IFoXYeGB4zqXn9Sje7++UiJhejuwuvkdmWX7jmRaaB+5sVkkQBCW+rv4nuTjQIlzMYDSVPFOrK7l1EBdnKf22coMFTQ==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSu/80by5gLVLO9US9i0G+pM=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&uuBJzt7VCpdYAUlHWNbNb+1P4TF5EeDhz+9W1UbnGjhAgBquNjHFlPu1QCRr+p54</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YprSI46C0AYd9BSYyq9+3JdrT1ebtBu8VKHbeP7bzgl3dQIXDlJ9bXL9gAENcRuUvfrcx63GszmhGMwF3SusleYBnVZyOqOnwNm6po1geM4Cw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bHQc9mDQNhuNySskjWiO3kptHt1lyTz0Vhmke8F7LmID0C0EfHJrTK8uJVzsfYRbopM7DqaeO5vMKbd+OeQmhjwDkObzT/AC79YYaOmKqJX/7/fidRrUlIcVoHX393UQTLLH0f6NaSEblCkePQqwt2fze2EvSYYJyFFVh+NbD5I/W6wo2agbTKVX4gFPq5tW8ffzE66SzTO/XRoy6XbucmIMGfFQBKG1JFCoB/OAuF+yIcgFb+lzZx2r6N/qzyMm+GtBmeLoS1D6vX+Q+9JB8M=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WQ2llnL3aocsUmADDbRJ+oTCUb97ex7/FoCqJWEDtb4w4Sj3f0iGEi+S4Ym/hM8UNuhDvCs5MIiWMZb7rR0RtpYENz311dsoR18HcARiuQdv2oO87FE+nL3gSqAGY1xS5MIn7wRhY/qg5Z/0BQwTfahZ8q1aSGCcjt7bAiqBk2R0T97xW5F+Xneic5fnqghRWHR67inqs99dzT7qbXAajJJgqRWtSCB6mTUCJ9/Bsq1330k+AeqeZ5KKVVU1gagq/uh29BOpe6SE8nIow9rD0rDYqR3HCV0v7SbE5m7sWRNrDjFdX7a6ZkQUfsxnkPap5acF7U/LpTnD88YkAlvMLwRL4M3OWrW6aSv2io/PdH6BfBnNrWlHx1iU0Zmh+bdoCEGnq+hFm2mylVh2Vs2uc57fxTjmmd1nh3f5wXcwmPAaojnQER3UAvp449oMRJLSJE2BpBkJQSbFGpGClI83a9lnl7NH1opRGgzgDMKDj13EFiRfIxonwqs6/eADJEidyyWz+Cz9eC0dmdnzseQ2moMQ1kr2e924qU23Y8ZUypSnNYT3KL1ZzWiu7PwPYEFWhXNtsZA4tAuBx/LwM636Fd/WrEX2OCFnzVJWdUwnxel4sji7FmFpb8uIu0MzWdC4+vP/lXYQA9BVx4Xpa41ckkb/ypwcrcqaa7dxQ+gCwBLjV0xtBIFMQg78tCrNdwe8FWzN59CgGddH50ey6Cei4J0vTSSQ7q58mPLs77nILcTpwAuB2NloLP+JMhxwwRSgC0Ve3w06Vao1tli5+8N+QBs93GMpjBHt6WiAtCCUTpTzkFv4Cn1rLjOUaNuBCF70VumuzKnrLzRieDs7J8k7zQrkvNYWwyhE+Mfyd7lXkpAZi6wWcJT93yUbgSEPg+2lrk9BUB275KtCxE9h+v5piGCLtJbNk+Md+kmC7Nk/Yv2xYc0EVzHll2d98jJWgZY73FP0LQguv8uVeZHTYfDbuxQt8l6WMgUuWeRcvRY9N3N4BSijOeYA5979cx3fXJgmRVwWeHc8JAV/ZId0xVOVVG+qNZ2kbgHkJPaBI5Ranrr+yMiQDAJBM513oxXD9vAcuavmzCCvEfyQFYafEdRZ6ljOa13dMH7DpEpNWJFRGyu7c/3LJkieYIEU4jV7+7eoxebl6hXpe7tW9AhauZEWtgbeVV8yAj395yttPW7MD9ZB6cLZ6iV/asaeg1szJ/qCg==</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="SourceSite">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx7jNfaBspZSZFySXAgzJkUZFB5eW9gdmEkVJIYI7at11RTSN3vYs0FtM5cU2a7caaaVaG0cDzfmcEqP/0IXlURcLPQhcUBfJPAJqeml3EfgVEoXHSEuRMLcvy2umkNcYZJREKSVZvqR09/7t0QxnRCNfAnwJHMA/FSgR1RGzP0Wlq9/TxrgcXXB02dHfEqAtxOzXi0IZY3F86p1yBv8EDdI2pwHnLPp7b17gVkxjDxoVSBjDmvCixVN4XCT7Fk20Iy7uT8dZAOPFynRuAECSlKCdvCUtPjz1JHLRILPYMUK6L6xmrVXHTKSX1xSgOK36XymRcabYG7rFZLHcH7q94qiKLgr0PCBxXqEXEbxb5IW5Rx4KH66QY+GL69Fb0IwqZPl4E53531c/9Sv0zfkQtlBB4o9p2FdpP78nfVs6esAhKXohWFTZ+Mm8bXGp4/+kpKWfvaNEr8hvzXb4vKym5Te98xLvJlWcSjDgMkum3fIdA==</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYc5TSqWcZ6df4y0eT0IhWmMRcumyhxuXMx5s7TO6kmvzUpIOjRXn0VGf/4gAkgaCoNCoF4sjmQZYM2woKXM8tuinof/jgUPweBSarrJUI3mDZTmLoUkXUwF3nMa/YlFkhsHqB08IYOKC/9e9ztmIVFwHYQvUDtkVn6LVvDzjUMszWS3K1Xr+bR1+jIKFbbQwU9TWe/LhEMZqVlOZ6hOoeHN5MzXenCKtCSax4pvzq0vHIECYrsfIaEC09fh7o6cvHkvNmZQtDrwCwgIWeHkiKZZaDU23vPlbf28lsmrzUINyYw3jRAl+Rp4aKe/WrjVt7cmFyxYYGo6QOv23nNpU3ymCve9ASXTnke7/w+5cUKVqViGpHe1rL5KZGeC/+XH1g==</Encrypted>]]>
      </text>
    </action>

    <action id="DestinationSite">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2cg4NyVl4yB1m0gZeYaC7cIhP5+8XEWQ6fQ9Kpclz6/c1USA+cpTwxWlZALZ2dOSz64wR192wZTTw3l5O6B/csTGoHJp+V0eeAyDIaja2MpFqok5gdQPIM+UUq6HWcH+qX09d2hdirCCryuxNiol1aI+cBnftujj7Ne8DTOKFKCCgVG7ZRWP6bBA/JHlrplHhykGbcydfq5/tt608cTdfOA==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgZSqPHUNUZMH+/1FK5UZsvi6yIupyyKof9GL2ilMyDic=</Encrypted>]]>&CRPLookup;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVNcV/RM/o81iyWlVsVS5+P0gsRVyL78O6iIlV7oPV8a2NAmnTgZAP4jo3gcaSAU/eA==</Encrypted>]]>
      </text>
    </action>

    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

</dir>