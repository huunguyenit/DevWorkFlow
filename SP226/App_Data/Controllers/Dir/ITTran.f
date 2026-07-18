<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
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

  <!ENTITY % InternalTransportForm SYSTEM "..\Include\InternalTransportForm.ent">
  %InternalTransportForm;

  <!ENTITY % InternalTransport SYSTEM "..\Include\InternalTransport.ent">
  %InternalTransport;
  <!ENTITY InternalTransportTag "85">

  <!ENTITY % Invoice SYSTEM "..\Include\Invoice.ent">
  %Invoice;

  <!ENTITY EICheckTable SYSTEM "..\Include\Command\EIEditCheckTableITTran.txt">
  <!ENTITY EICheckDetailFieldName "d85">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY VisibleFieldController "ITTran">
  <!ENTITY % VoucherVisibleField SYSTEM "..\Include\VoucherVisibleField.ent">
  %VoucherVisibleField;

  <!ENTITY % CRP SYSTEM "..\Include\CRP.ent">
  %CRP;

  <!ENTITY DetailVariable "@d85">
  <!ENTITY DetailStockType "2">
  <!ENTITY DetailTable "d85$$partition$current">
  <!ENTITY StockType "2">
  <!ENTITY DeclareStock "declare @stock tinyint
select @stock = 0">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  
  <!ENTITY UpdateCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU4SbipKxGkQLhVEVmO0YJml/S+KFM7rnyA3BMcQez5PyDav8rUBrr0KxI6aKu0kGKuKkutPJYPeQOQgZgm4kMCScy0eQI+unKeS8RRAShUXPhh23My53h8KD0KLm454LFAm0Z9mGT4C3md5Qpk+506KgJ+85mMM/0JjbqNGli22KaTaAOm+WbpCNKdMKaW3vRP6lB/7Ubxv9ntZeGOXhoxIFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kpdQYypT21op6s1xs1oCwb3QzoxaXRlfxrdYxln6yfQ1AHYozmRtEhwYk4kjHU9kLx+L8xM4Tki3oowaUf3nCdW20KKU862Vo2pp/PZmqwFDag2OJGNDjaLJJSVn7r7Up2rPkSQG2ffZVGZORA5xzn8nQe+OFb7yJAZev1u4BfvtvFxutI3cnVPkOkGGRGabu7FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$nNk8dUe86ilcR4y336bXqTUSy7ktjjXN/aKikpyVpm7szdFZrsSj+JSjypuECGDmff20wV5bbwT9hz31GAHZHbkFdFiiF5mNFUjcPNjlJlQak8E888BE9ND2TBOc+zrQFFp1wIXM9IapijjmoHWeDMyL+IOMrA+TK4iREiX0Wp0ekDofhrJaKv27/UkWE/Yy6YAludY6BOekJlk/uq0GwQ==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$nNk8dUe86ilcR4y336bXqfFgqZPJCv2wE3M0sdmtcpPB2Rfza2czf9AiTAqKZNQVy/FBnMOn9rMgmVl1eD9mr/E7/0ajifmImEqlJPxQ5gar5iref32eE9kOPgVnP0KAINxlmfFxB2Ju4GT3Nqrp6xXYSkOyxVOIzCPmJW6wYerknvyHDFilTQLr1eVp4E4M/E8zeeIlqtizFwZJ+RIda4XqEmSZawAWCQT1Y8eS/vn10pMceScBwBo5ALnphQ1dg4z50I3fsLDS+VBru9YjimTONPzVxgYlXM9sEeWuOYRfSNVaLzT1iF42iZDqvnCjlup5oCWXmwdnthckEy8c402J4ljwu3ZjzWlWG9GKUt3wT4G1kAtmWzlQQ45cL+X25s/gH9FqVj4tmCtirVsuY9iSbneJzDLc/vXVICg+u5Y=FastBusiness.Encryption.End">

  <!ENTITY ReviseCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuyng3w/X3X9PV9tpzg3z+nTB/M8myVIlemCfTMJHqNrBB3xmSlVwh6zgY6h5OrlcIQ/llzEq67kkCtDm2g+nxVmwXXDYWgGCJ1jgSh2GW+U+i3QRgDXGQ9DpRgqdof2mgdAZo1EnEqbDPoE71nf0QVEVcL1pPNHVS3Pw9cvm7rcRFCdixD6+zzOavmt0aBz/B1UUoZmNol4vfDMWlQdtj532z7PiS2F/ny39W2iDCvL4FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kpdQYypT21op6s1xs1oCwb3R6FUuArlQglNLPtUUrnyIrXM/ru8x6WBHmtkDaspsAWK0DatrWihxl1Ri3Nah4mUExMr9k2vheLSxnc5RYkxZS/cLHiFLDxO0OYhlsEVjaLqnSl6mCisIzYPbD700JsPjkX9BSv8sPtLX+pDfqtUQ+V7tcK/+qGUQkJxl90ewHhFastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNK4m69qtOF5F07B8DmvtehsQ5CBejcKOQFiGwXJfBMbzJDKx0Gsr1E3KJqJnm2LmwrzIPP/AJaFnJ4sk8VhHqOc0YMXFtIkevOd2y5SnaQVzR6sKQoAhSePq36SlQOBRihYtb06qis87gy38h0mA+wsv+/uUtJy7/EoVvzyEymSt0ho7qBUifjIGCmxuKycCv0aGNCy3kzo1h+fTp9iQsKU=FastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNK4m69qtOF5F07B8DmvtehsQ5CBejcKOQFiGwXJfBMbz4a/dLpL2PDhdCxsxy0qlp64iWFxT7pNCXpR2L20EATgWi9ImwhabkbH7shzlPORYUojzOAFRigioJ/hQDx97477Ic7YW7JXqRtlrPnFSJ80PE2QeL7+H6oIEO70NbItUPxeo24HvlPpKygU9OGT3g0wcVyzsKuvaWEALwocuISijS7VuERTzs1ZpW+7za1Tx3e3cpwthd7jLmJX3awuSnDencxbNtyPXTFbvyFHR/RI1QZClk5Z+lzI6Hz34SKpyA+5rUxRObhqMutVL7egtZpuduMKUjHNAsEmsy6D7iur8NhmDfULrMfbsIknouBT2iZG0T+NMHL45FcAMiDH2ksalRT3w2JDlplnYj6dElPY=FastBusiness.Encryption.End">

  <!ENTITY DeleteCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU5s5yR5rH2Scw4mgTStQ8fo/Hz79HBlPyjBrB0IYTN2yngxN3UdoiS1p0mbR9LyCHxT+L+zLPjo4zNvqe4bLty/VhSjUHhpmuS2Fgys0V7eFaZBanZrW3HDZOz70A18g4uKV3pB+qO6TFoI8nu7x8ndWo2ZF31DAoee/5XRtRi25Vno4RK1jRmc/BtBQ8Jo6JrTy7Uomgkl/CEGM/R0d803piZTVIFEdZVr4OMfThcNjcepu3squiul4+Cb8DMbY2iC958TaSByWjPWojy+8BZIpN7pqlzvpXcC5/rH0AvThVzfxXzzd4xkTyBtX9n4iq5S9sua8tKrKY27ItnVtzCasnYqRLoJSYR1QDkIhbJGVVuVdxTACxJZxxmw3zRR0fSiVO2V0dqEckmCd/rr3Cxx/gQW9ZcuxveUz+OFneU2bA==FastBusiness.Encryption.End">

  <!ENTITY CommandWhenBeforeProcess "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbizbgOPt4KCg/UoJsgbLBnc4u56ES5g5Nuwo8FKpOUzce30vo+lTjRFcNhFty15ZcbxbToVZDLz5pPu/tFFpBdXMA0z9F5eXiWBblzCxjPqYZr8tEWMWz2/zKmCou06WslMCVpzVcX9ahkuWWfcxfPv/e9P8J8LZqSfcS9a12EQY+tLh6eTu4WmTcuZD/Q8+nXa76TwrDSPuHVyMmsLikf+v6aDD2ducz7Iv47v2ZZO32vd7YzpbTABfM7tUu+IPGzyFRV3UiAo7+PLKeUg8TXl4fHCrysOsM72uMBQedihXoG65O01zN1FtlkrWS1mxyA7K71gpreK2QntwY9XE8BFrGXzx31igiU2hw9ZSc+07v5NdB84IpYyWwa/6BAW5tFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbidY+b0e6umF3sbBUccQbGj3T448jO0uKy4dm0XOcP87doCUehhDV78kaloFXB5mC1q3AfCmpD1qDX/mkrZUNe3GJNYvuGCRJqfre+ZTZ4nYb5nHmhjZJcGoKjvOjG2c37lMR/SqYJDi6aMB5D0a/v5YL0gE1xMYb5zGf6iI9VHSpFastBusiness.Encryption.End">

  <!ENTITY f1 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11YyySZqScJgrCBFxByOV/cCyS0PjKtChSPp9kD8vev1YZ0ZnYGhUUAX62GXZ0sy5N+7NDCYD3aFA67T55K0T/8KndVVB82EM31Sn3QTaVSzWw==FastBusiness.Encryption.End">
  <!ENTITY f2 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11ZoMRRFgLZNlhPUFrYopuezRmE/f+wOtM3FOoCv1+RkM1ibWHgLCq2D5mWYUP+EPSD4MEIs42c6ttVKlxOd6HpLPEatanNPUf0FI/RBigG99Q==FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCxiBgmp2JUVIZ4oMOjMYN6CTG8iKdB+N1zbf4E+bOiNev9Qn5UEivyb5fVXn/o+aW9fM/h/tz11a5jLDEMWmt6aWNBz1/Snp13rcSg7BeM5c=FastBusiness.Encryption.End">

  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBWipVOhHSIpkwt2yvxCTOrgmZ88uq9AAgNIZD3KkZxHBmfHRzPOS5yO52x70EUxzS8lGC39QYBxUXOwQv2ULLCgw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2ij2CM6ZZCQyHItwTQ4sDsbXCHVqppsZbxJf5m3h6Qs+nANDFNMMC6Zs6AfI7CHcRaBqhllEtWSaTPZuSylA9tfGvpQzJxPURs3VwOpA37dyDgQhcjkre3C9TpqQCsD0pyVIcBjYphYq5Vznf5/GKA1Fe8qe3ZwhY5+xq+mpur8krgAhCw2s4vPdU5MeNqRGTFo3l0oIhKWQ+GbVU++zMJlVwkQTv86BcEIt0BkWtFOjQb4H9Yzny6gk9Z6xlj1Q67FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBW6UphOoPYqDEj/m0+pSuxopSHPtxaO5LQu4cPrHb9tXT6FUovAslCzU/lkIbr7bGiZNpb0AzLZ0tfju/MEUWTAg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2iBxv02JErqFBolhZJaZBknSSVT6crAhCY/+ax8q8XvxMXhAeAWAlTzt1nhrCbnAaJOBPsXg9+lu7A2mNcpBE1tihCljk1lT4bjTAi2QWbohnyb813TeuLBWZW46E2vC5KxuXZdHwmnJEBg559VdjcQ1F5pR7DSvx0a8tdvcNPdMk5IBGaBBfV7QdVL11GA7OdwLfYz5PeGlUT2JZ62XnOORsZPdkehVRlMk0DWp2+A95d/eCi9oBoNYsOmvbGVK0MFastBusiness.Encryption.End">

  <!ENTITY Check "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcCluc8DSbPkevjpIKfdwSBXHjkjvu5DNJA8PI8jDptpfFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx87NGVe+14s2oYsri81O+8/Ic5p9VHXxIOdfU8dmo5s5CxTMqiotBqNS+eyIrcsdC+OGf/1CUcCKb6T+OI3vE3ej0np7iGmYtZjVx2fbFBbLu5Bp/tkLahpl10AoA7J3FPnGuO9W1UXLXHqmvR5LVlbDybFVKOqKYGkPZrkfPMrhP9G3gBaOUvUhzI2WFx33FqcFbR27ysK7T2QLrs7JcAbbNyTq0oULtQUOstmp+Ad1MD9e3y7mZbQYC9D+RRX+rY8YMgjFQuumAnRJeT+DqAlZVoFNrqVDvV9NAe0aONlkg0kklKuep5CGyoEqxFvG/S/G/7lEW3+f7d0d9nSaah0QHf5p8KWShhmVOfAj/rjXq5GUEUiUE2JSBgLhTcOKlVMFjGPhXuxyaSiEYc2iLZgxeXz8kSaUBg+XfsMJLmP0uPnYDHJP7hcR9O+KBH9+thCF558T9IT3O9KD5IvmVlGByQzHG3FwO7TLHA40xodRn4S38ySg3EkBSv9JE40KZtSHa5EqzJ3vJZAZj0VDnYa8+xTDlowlhuTpN7xe4zyhFastBusiness.Encryption.End">
  <!ENTITY Stock "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4bBxSeH9QbwTaSNCChNgTljOEJw/cvdKh+DUDtAXgJFiaA0uDS+d4FDgcEM5QGe5jkz1PNIQ5Dzs8TWyZuS6zpCnnah+nPJx+70JtuIBV0nOoMzJJWDkWLVB4Uc9yJB0y8ZQ06uwO95OADZHj5GStTKOO1nHsz9y0iNmS7CAfr1rclLA8eftc258EEjdZ1O/PKpH3dVOY2oRXO//1iYX71luu87hnLDRXOE51wpqq96FZWqQfQLbUaddG8Q4kIht27kEzEZwEacM3+J5aM78NCdOiyvbWurr934+2O//QzX92986sqX+0abrZXZsAHW00394f7O1g26NSilmZnQmwCLT/iNYRfFo/v70AbZKmoTI3ncD2mlRMSWObIJ0lzePAt42zw0fgApTx5bEuatZ/e+EOKG1WzOHSldO+LG/VFQj2G3Surp5LcHmZAFShEHk20hV9TSt5C3biueWzmo+h0zJwf+amCjtkhpWxovnZ/Xhstk71ofTWSvovzST9a4eip3nfn1SrcodqXzmYI8ogrQRdBfnydZA1RP051gfqfi6yyZNsyoTHs4J0KC/X0YcEpsIl5MImpSUKfGueDfQygAgMXXkcUmno2Cuz9+OoLM67fNjTQBveiue8o5wrAcchlEYnf8T+xP2tyHHhuWFSwLPkwAcios5+8XvyNmjUskmNCkyoI4aUY7HeIiQN8AAlPSV2TCFUMXC0SwkippRf4PBbPVEtufxSkCMQK3kK/l9xv0fboJiI822KJzaQ9GZr05hc3l1cjpn81H48DaOc2ioVGmWtAXZsEsUDEiiu2tRXdok9QnKxFj6x3/hvGWz4NDOgukJqSwbIBCWIJDDWb9Uy0HtHY3JA78FTc3TGxCyKrh25ZL0GpSlK9Fh5mmTIBQGXSagvyYkrigh/IIo/6lIWRBMS0GV9eh2HZQaiMP+xAbN3ZyQiTE16hBvTPhPGdjG+VDSP85InVa10p1qGEbpvGBAKXnVpTR6rdgup/V5FastBusiness.Encryption.End&StockType;">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG2XHTBQA+AXip4lq6jBdliR+51Z+Y9nM5DOJuuTdONIku4jHBgbec1ZlFq/VKpI2e3+fPLxO1hEOBbYIlfd7zyoTgFL8G2IpUdOGc9tC6F6mWan2DcVxau/uwayUAwwbcKl7yTJJhh4Mlfw+gjEusBQUipnpdt9WxDCdiMwZf9D4h1eXWTQdAIfJOxIiRxV5CTFk3tDGqxIZCxAEgCc5mx9aQp53G318wGeE1GJy5+/erB9RxOlOA7L41sBni6pRJU=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4durLWfabZ29SeDXjuZkMV8m8JoCoQzL2AQCmEI7QczUmN0gBRDhTrXoVuGh98qeTfIMTleNHRvJAs3b46HXI5w=FastBusiness.Encryption.End&Stock;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Vt9BawnTeSfw8diY9T4uhk+1LdXzZxaoSBGZJM4V2aEU9k0hOKr8A6TFgCnSLumw4uzJXSuT7hx0Z9zRyiPCZEr1kabJozoTRGWfW1HMYoong9fampEDS5AI+QIdl7wYFnVdIgY21NHzgS2eZj0wlYWlErnBh4zwIOSHvUigVqj+DIJp5QP8DASfsAvfKSDZK8isCsk37PrjWFDq+eFKDlSo3ZRi01s86BOPy1I7Kcg5CDkMZWWAy4O4lxCAniG/s8+xiLhzSAcJx8plBWSxXeqS2uY3OU7eU1+jB1e3i5DxtHEifDc406WKjPz8FTNEJooPX6qIlH/vauV7DmsYoJH4FBX4mojIFzjcJA0wbANtFn5zR9U4hnJ0DHTRQitmtuzIe23Mfn3iyw9/HJ60dw=FastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu2sqX0NQ0kwmURky1ixUbxvF3Oa6NYgQPZTA46OhpuVeQAudTJ4Prh88A+TEPpUGqj4EEGb10zHLXriBwfVqN2Ep2JSyb9BxZZGRWQtAg1Ie070w+g2PaLh/ZWipWlYHc3UT9tebMUq7pb1VvcRIYQvkC0ndxeC12XneEFp+tWXibAgdb6BuXtMrgSrLgs6NzZUBoc2BIxYdGYdsssOcvihaxk/4d8zclVk7RcY7AeP0HlS0oATKjumfOAZn/hVkHVh9d2TP3kNcmhOR4jqFt+vioETzwmr1e4GlLrhqxsVoFastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsRImomVT2hriNrratcT+tPWI2okEpwye7BNQdboStzaA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTBgYxIESoo07geEqT/Jmya8/00D1v9B1tPyskI6PFDDkcAfR4FV4omZCYlPYoM8oeaAxawoR7HaeskZ1/dnSst8dIMVsGZ0HFCJd+uj9q4rJod29WYWTuoQdLvwULeHXK/J+NVF6WpEw1HQTp50Azf3chIkv0pLGfbU+Z9qHP8dijStL1/tDnevgpmiEoYowQ==FastBusiness.Encryption.End&VoucherLogActionKeyITran;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XjZJWgrht91PgmGLABy69PykfZIIaq5E4yCPvIxU50daoQlg1xfoCiznj97jZ/OlQ==FastBusiness.Encryption.End&VoucherLogActionKeyITran;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4aoEPi9x7Ut8dQlaoO9nwvgidKSZIOnwhc8J44vZRE1kvdqZngHPLozaGHug62z0tw==FastBusiness.Encryption.End&VoucherLogActionKeyITran;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22eNJo2tXlvyL4gzSRpXQlZa2ORNh/kpmNcl7lsCWHGp4EcNb5r9WfTbN11wfxg7qFw==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.ITTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m85$000000" code="stt_rec" order="ngay_ct, so_ct" id="PXB" type="Voucher" uniKey="true" replication="4" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu xuất điều chuyển" e="Stock Transfer"></title>
  <partition table="c85$000000" prime="m85$" inquiry="i85$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    &EIFieldsIssue;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu xuất" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
        &CancelStatusItem;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d85" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="216" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="ITDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &InternalTransportFields;

    <field name="so_buoc" dataFormatString="1, 2" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Số bước (1/2)" e="Step (1/2)"></header>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5WRgplisf0nkrhdlc3BDmc82mIWeoJdlaphB24qDcLhw==</Encrypted>]]></clientScript>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    &InternalTransportFormTotalFields;
    &ListField;
    &PostField;

    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
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
    <view id="Dir" height="276" anchor="6" split="8">
      <item value="100, 50, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000-100111: [ma_kho].Label, [ma_kho], [ten_kho%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1101000-1001--: [ma_khon].Label, [ma_khon], [ten_khon%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="110-000-1001-1: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [vi_tri_yn]"/>
      <item value="1101000-1101-1: [ma_gd].Label, [ma_gd], [ten_gd%l], [ty_gia].Label, [ma_nt], [ty_gia], [vi_trin_yn]"/>
      <item value="1100000-110011: [dien_giai].Label, [dien_giai], [status].Label, [status], [ma_dvcs], [cookie]"/>
      <item value="1: [d85]"/>
      <item value="11---101-10-1--: [so_buoc].Label, [so_buoc], [t_so_luong].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>


      &InternalTransportViews;

      &EIViews;
      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &EICategory;
        &ListCategory;
        &PostCategory;
        &InternalTransportCategory;

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
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandWhenBeforeProcess;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        &EIWhenBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Fi3AvPh0m+IRW6MxNXBU/irBnSLDSDdUuRk/YbQIOmAvZlyyNAF5I7ut/rzs6pN8wLwNwtN9kaKRZ+w7j0aq7X4CjPI11kdvHfEWeeuYXNkP3bd0gNB0OvOi0nl8yjqg==</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05p7W0ruORmEPEL9GtjcKlCQX3PTRgwhUiK6gqQUbZVhEBOKFdUVP5fTHlV5ZDDIBiUN/IVlLxoSmTngO+UUMGQj5rTJD8POXsVMgF1RtUK2wOGiaWqaCmaOr0KvHWRl9nW4T+Yid+LcpHVuO2cJO7kpyCzoDEy+oUkeaf2lLNLXi9DiTdYMS11GRQa4lD+BEfQeNgOCkjtN6XhsmWOUhiBZ+iSLFFjzL1oXikJX+jwQ</Encrypted>]]>
        &CommandExternalFieldSet;&ETInitExternalFieldsSet;&InternalTransportInitExternal;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aY+dnvA9CGTIMe2GSSkZle3W9DgM+z3u+Fmjwi0db+Z5X8QYa6tA0Tk9qSb4RwOIEu9r7j0ZrLiyLNRdNCi0D6SeC+MIInS6TwiV0YVLsjnodWKoF2M5LN/+SzfwTzYLHZOt3fspljywE4uGiMPWQI=</Encrypted>]]>
        &CommandExternalFieldQuery;&f1;&InternalTransportExternalFieldQuery;&EIInitExternalFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ejy0vQeeAUs4EyjyvCDLwUVT1Kqjgon5AU9r/cDGZS1/TdXfXEgbILr273CDULyyxfbF6xoZd3YVGj3c9Ta3XDlVEwZxFTee6WaBv06xlTcL0bS655BLtqX2JzbiyIHdQ==</Encrypted>]]>
        &CommandExternalFieldQuery;&f2;&InternalTransportExternalFieldQuery;&EIInitExternalFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bOk5IqXPHv7Bu63rzY2G6z4Bzy8ErXV5ar0Tqf8haZ7</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &ETWhenBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandCheckUnderZeroStock4Transfer;
        &Check;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsnIJXEAxJq6uOUqOoNjwHRxxSrAKyRfX7fkrq7tjDVJ9Cv9gaPl2O2hwdJFT1sxP77xdeSTges5FZqRsejtoM1PyShVKEgNHSIJbWXZZX+xJA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKeQYeB90NlH8S314XWfxj6m83jtClVvt/+VQumzUCLQdSRDb0P6Q0l8NGwagfMhgs9D928B1OnX9lvzj4C/rzQ=</Encrypted>]]>
        &InternalTransportInsert;
        &EIPostInsert;
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
        &ETWhenBeforeUpdate;
        &CommandCheckVoucherNumber;
        &CommandCheckUnderZeroStock4Transfer;
        &EIWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbizbgOPt4KCg/UoJsgbLBnc4u56ES5g5Nuwo8FKpOUzce30vo+lTjRFcNhFty15ZcbxbToVZDLz5pPu/tFFpBdXMA0z9F5eXiWBblzCxjPqYZr8tEWMWz2/zKmCou06WslMCVpzVcX9ahkuWWfcxfPv/e9P8J8LZqSfcS9a12EQY+tLh6eTu4WmTcuZD/Q8+nXa76TwrDSPuHVyMmsLikf+v6aDD2ducz7Iv47v2ZZO32vd7YzpbTABfM7tUu+IPG7VtuoYC6vyY3K3zGGrOvAcsShpJjY2W2eM/HeVKWJvYl2MLweb+6txXyVpr6LgnhJnuXYGa6TySPMhyNuIYM7br+Mqrv+rJfhTd/MQNviXyMEPwAQkJhqhJEbyvM0J32DBlRzPmgeUsjrIg+iNBW4JGDwfHcIKcOV7IFBVvbYL0bpQhXzmepFZ8dZUhaNiT8</Encrypted>]]>
        &Check;
        &VoucherWhenBeforeUpdateLog;
        &VoucherWhenBeforeUpdateLogITTran;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku7aweNuywa970FQO708FvB50MDc++tYdpzciKbJ5vnVM8NB/U9kHbhNd74fQq2+NPN3TCPN47k6vslH1Yv4OqlWZIwq3Gwz8zxoaCnszYMQypQVVDRO8aNRAlKZ+dZbvmIKyW02tcd1WVVj9IDypNz7IIJVa6mGZx7zg0xue3JCn96I+RUAYiMTeP+8hnQA8u5wD2letCoTAD4LDdi0nFZCeDEW261MIgFBmRh3Er5mbsZhALaqjqRiKfCk5ZAy5kJ0hNRnoRKeQR5LvhjBrAgcRdD9w5ooT/i3U6WxeBXtFICEoTtI79QwC2tOtc0JBXrlOMRWmS+PhSfX9aQwymkJXufAypkJELO7L7SV0Yfj+xM7sDsLLv4b9HM/0gEOtdg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eBVxqs8NTYtI8W7gEwICEL9aDLklDx1nvFvGQl+Gqv+5JY+/+UUb5BWZ/KqZy+g0EJibK/RxIM3FAt8PPihDtL2YwMUVIaqyjv5MvSYfpV+RzP/MW/BCNVOldCLs88fzMYunllFdT+KIktSFY3Qo8jVGRg1zb5g+hhkFQfYSLUS8qAMNry8Q00P2mjCknl0H6+RRg23/O/YcbSnNW+E3hjFnTP6KRZqMDbofKGcHOxX</Encrypted>]]>
        &EIPostUpdate;
        &PrintPostUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyG85UD92XoFJOeI6Uab4yC899l2Vymk+s4Ck/aqa04d05Uy6Nksq5XiwiHRIJ5t2aHuQl6TKTEH6ztC+GjOxu4Z</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &InternalTransportUpdate;
        &Delete;
        &Post;
        &EIEditUpdateAfterPost;
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
        &CommandWhenVoucherBeforeDelete;
        &EIWhenBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5yE3oWgnls18inR3g88tder/Ca9VCtECDRg6joH8dGsJsp5czhvhOJ6B52bz2NkcJKIXSx9inhLvR4eipTMvISahH6btRC2+rVS9whLjgtFWdId/YEyE1IRU/0jz/1cvKZadMCILs/uw6vUYnGPj0BxxqrqKOs7quxTVCTJcE0QcQBNSLdo3XhIYwDm0lnEzL5/xB+XJLtFw3eIYbpMtESOs04sc7Cn6VI+5F14CoMsXMbgwxLT+JtBiaYkQATroenjrSM6unKxL2HNYXQPdij4bFx4WByKn3Te2nnD8E0mMMctqlZkID7TKbscODsDz/I+nPfZrdSYjJamLLUjD13o9mMbundrvAH//0nWIQFkDnvSuaGpgS0E+CCobprL/LXHbJxdJfGCzquwq1djZsGFJvXzMfV6qqz84p7cSx8C7B2coVnl7+PQYSgka2yPd/3ElXjDk+ZLXinFH6aC3Ujt5kSho2IFaqlUt08+y2nFEROMAR+GEFBw2sNwVG7xfC5SjGL8bL2FlV9F0olQFbI=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5OYHfV4EKouq88N2Wl9rKGFgCYkFZslzBP993yO5hjWgNmD0ASkCkXZlK+Tr12j4gvckhrQ9dWM9L9vkgxbLzg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &InternalTransportDelete;
        &EIPostDelete;
        &PrintPostDelete;
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNkDhfvQgztTBPGtSARmUOWwZuYq5tehNh9Z36CF+wT9E/6bdP8SyzEnyWueN9G7Awve7Ng5acTMY0RXPV2LkR1UqC+w+vzRKZvDP3tyXKA2oZyzNTn0+dyCwQMVZmftYUZ212X8XwtbNXWOvY97jFTtC0mskg9sACtxqQbAC55Zg==</Encrypted>]]>
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&ListDeletedITTran;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeletedITTran;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzBycFw70N1ZcpZaJ8pUSTg6Gfuvc/J7FdYku+2iPFJ4cVmWC/pSKMpfqbdJO79JZauMwQPMeJwrXCqFAdGVk48O90CGSZh4pVbOgG3FwaNoB7fBHIAZmh05QSggazJJ+KLI//NYAqKyjC0usx7bCTj+4MIVNMUEUEn5LfS4EqMpO+omAMpGwMPUJ5WLb1UpiB1SwJ+Q/iOmotrK1iRWZpgLinVcC7SnrZNpNja+R2FGGP0Ac5OXRDktBK/ibpLXMp30lXSGeH/8R/tqS+zHRimqQyXSd+mcUgzGR7pYbfZE09n9HiLt80UI5ktT6OyyID+F/P/FroLy8D3HK7plsxLiNClyFuXmLfhKHfJFU/IZ8HLZgnYoaNou6Rewo7arSTWWBOA2Sc8OSMymxhUya8MRl6JH+BPEM1YIRrS7JRHeOtGBp5DnJ4WZdP6abc1W1JXetPfe0Wvtraz+xSqgOvIO3d5im2oMCOwtaz7S7Cli+vq2JFafguHpfgoc5B5J7Fa83ApLyNuQS6VNmZg0RBnGkiw02SQbj3hCQ8XC0zalNqqGIstfgHSC/UmGQ5dkrrRDkfrfrebu5Y9W7yErM8kfUtniLkSTMybO/RW5HKmnEFkDTBTKMhCKZ8fxTQIGohJb132J7Jslm0ThHQ+wrOSvzidkpNhEsb59J5k81fzS9hRwyOGsXW4USDeSHcGJ/B3sanj022/apXiH2loBxFJ9/59Q2xM2zRmpnm8oZWuUHj4=</Encrypted>]]>
        &EISetAuthentication;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9vcTcpv78KaEISuDP/HMMEGQr/qASNh2zP5HLYnb+2uHVsnJrrlNSFwq2DbO/NgBL</Encrypted>]]>&InitFormVisibleField;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoF4Fw7hTGdJoHFlBlSbbxkS6s9IAsba9f9NWXVJ5sU7+8UIyDQIvuVnK/Z1g1vTUg==</Encrypted>]]>&ScriptActiveVoucher;&VoucherLogHandleStatus;&CancelStatusDefault;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxfKooGa3ASOCQ6gSZDzgGMcBRu47IVfK8YbjEEjRtz1OA==</Encrypted>]]>&EISetFieldsReadOnly;&EISetFormButtonEdit;&LoadFormVisibleField;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;&CancelStatusDefault;&EISetFieldsReadOnly;&EISetFormButtonEdit;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkSmdcdio3ohxiLtPrZSHcuqymkFXZ9FfvUXuC8CmGv+f5kWzapYWf7l4bnDU0j0S02nAPkI+czczMkeyQFlWbDg=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezJ0Yd5R91pV6OI01xqMbMUvfOeQKZCOGUp7K16R7n60s/av1cCvKkGIYzraICUB4R/s++D6GLdG4rxjil4hCc0RB/wsSxBP4KnsbUDnJ4jPoc5qkYicdf5ApUCmDp95YAAWROAtR2i3uS2aelt+zNdcZiBwXn4/yVTE9yeesUBeYSqq90L4eTyfGADiRqXSyI</Encrypted>]]>&CancelStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHArCjFbZVAqfhHRa6/74p4i8n8rfYTPeRJRahHS51WYh7H85GsuOn3Ln1/eNI3/7NR0sCWBUqrelBjUDREuqwdEDBSQz6MoKrRIiSM3I77OXoNW4CzQGprYngV8UjeCjNOKUWu/Dj0N/GX/WUwZV1Wuhsqh6FKqg9oFJuNJxUKLmnH2NWc/5gWLeN1B4/H9N45ZTOyfKZpsce3448KBYa+mC0ejinSyZe+DsBc3eI9bPDmBPpTaBs4/XiyplXrQt3+</Encrypted>]]>&InternalTransportFormMasterForeignCurrencySalesAmount;<![CDATA[<Encrypted>&Ua9VMlNUO0V5iRaitVZE8tnJjMUPprj3uwEi7bXDCYA=</Encrypted>]]>&InternalTransportFormMasterBaseCurrencySalesAmount;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egREw4hFuUwtkIMkjvPcmIrSEc9jAK275MkkPzXyJN43Uy0hCBH12jSGS+ylv4bM1qw==</Encrypted>]]>&InternalTransportFormDetailForeignCurrencySalesAmount;<![CDATA[<Encrypted>&V46JBzzwFqhZ6RTLEdfFnLr6XW6IquvPc4yMXNAtEFg=</Encrypted>]]>&InternalTransportFormDetailBaseCurrencySalesAmount;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egT0AKqQBEj5doOoEdxbV1XlXddW9YfrTi6yirn7J1beFa4tSh4INZkZ0NKOxFsD5pct/XapvgjDxWV64U1Ya3nl/KcDw4zep6pNthfaj/9gkJWZ4kVHBsB3yUqSGAYxvsw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WqhhHt/k272dUS65C1dUznfsK8O1i7YrIRWWjQj+LFyNU9/Skv5zH8r5MJZRKUxcBjog5tL2rJcDM9sIZ0oCIaTKwqIpot2dttgArKWiIJp/1C+dGT//BLKcuMexgVdUZirQV3dQ29C9KELQqRK6yjA==</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxCLoaf4Gmwgn2t2ySyEa/mzMl9HG9cONPRVOw12BsUxvRHPi0ih0GUsR/9ktVk8BX</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/RvZ0tNKtcQlv5gaZxtcND65Igkml9f6ZGZJIokS/xHsp+3laEhqoiUNp3LdykTgRgce7czfYjodoI6k8zvvAaRQpgM7elXTvI2xeqkiFCOsBGSoNuorBiyLFb9KC4M024AC8i88t4mjVvaRsOuj5ig=</Encrypted>]]>&ListTabChange;&PostTabChange;&InternalTransportChangeTab;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP7s6m17oy6HgUWIc0AdI1dLOlbfA84Q5Rt1wigyQoBZtcXQ110W2rs3KUv3BVKFvAg==</Encrypted>]]>&ListTabChange;&PostTabChange;&InternalTransportChangeTab;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5VKcm/ftNpsgHVPiGXPUJs5QVFoBhdUYhWZ6oBKqXKkNOPj+XRkjWmLpIc5tfwV0BrFcfNpBKVvLF2XEBbLhfC89qysRQPxfeqF7596JfZChygxlw2uGb22+gctX5TEQH8I+ZumKM4vAu6LnY4YgxRIMqHdSmCsF2n+R3DPjma3kggCrO1Hyz2pfkcPUD0egQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bHQc9mDQNhuNySskjWiO3kptHt1lyTz0Vhmke8F7LmID0C0EfHJrTK8uJVzsfYRbopM7DqaeO5vMKbd+OeQmhjwDkObzT/AC79YYaOmKqJX/7/fidRrUlIcVoHX393UQe1ZAD0rmHLCJo66ZjUw8dog5GkqQUr5WB6jl53yaCk4q8X1WZMxgs+8h2KXDrK4/Xt/t24OQpxpQ5CHGizjG2PNGQ/UNY/hdrIEgfoTH/RP5lVMvVB3eK/vPOL+hODJbg==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeJO3vnhb3QqwkEVVZebKc712im7cbLnyqIXG9+qJYWuKQuJOIQhJE8YOJesouYoL4CmSMQZBPtoimiLAYnmPjj</Encrypted>]]>
      &EIResponseCompleteChecking;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WQ2llnL3aocsUmADDbRJ+oTCUb97ex7/FoCqJWEDtb4w4Sj3f0iGEi+S4Ym/hM8UNuhDvCs5MIiWMZb7rR0RtpYENz311dsoR18HcARiuQdWPT/j2600hBEDTbT3IPDXpSuKMzwTe5eomGVgJhDI/Vfig+egtxRhDTtsc76fW+QBe9jnoAfOMfB1eTE0jGfk1bWvvueMfKWBlm5OeOS6ONNb6lLkDVpomgcdqdaDWW0HsIec4oh0d9GD2mAIAxSjW8o1MmzgWqS8EGX9psPZrVaL7LFwhyjRm4CBTu4KTp36CVoSu10V/r5eC47BrB5leyzeVAWL0Bze5LVJ+KlO705SyQwzc+id9vnkIauWP4GRKlYMBnBPZYEoZs8LLU2jEr6J+Dd/QUVou5oieZ+691OSNmpeTRp4mKJPhl5lOwCcLL1AhIiqfGjj3F/E1KOdx9tFgW10ZUN4q1Sp0vWFO5ysNqDzSB5VAz4Lme15u8osYgvui65LVEH6K+aGV+Skk5nVJNkKv5D0YacXkis8Y5qEMcSbZM/+wzf91JaDerubWTg0/dYnY7+nzwsZB1KHl852GJYHe5hT/5HAl7Z8ZvN48/GVo9MLlC921uUYOp+/TImbzj1ogOAdTg2ib0FU6u6n3+fqI0mLP5AS9mmk9G+kWjwqZoBmtuLsoKG5FFWz3Z9EEEPgLjJUIJQe7u8pUxpK3agqvcoKqL+mcwXTE2GuEAQ9mX3z4tYKuA3vRMon8oAwpFN+2Y46ycBYPRJaMysh3eCgST0ptuMQEABk0MZ9hGhFKe/oittXqhSwY3JYDcUh6aC5hAvcPQEqc5JVxgeFhf8vNHP40SSGvoMP1OdOrrj904XLLHD2NQCq56eEkoO6yEjOC38ljPRZ7BxKJ74ZsNVx0kZMqNo7xxqWgfcuevFNPfmFt4/MV4g3D6JZ5Aw6+TcQ1SOP+ZrDmeeYA49FmH7rd7Z9on8tikWQQ119Hf62MaV6o7PHoc0FWWQOKO56Nbjix9gfV0QHEgkVkUP819u+K5v4myauTl7Npf8scnnjKSlKYZ5TIm7lPYgMg1PAVv3B1Jj57WcNurvv4vWcv9VHIZvs82Y47yj/F5R7qMx4h8bj+AAP095M2N8bm+zPbUkWFYOJlsfepYjl2Wm444PZHKs+73i3995WUocKsseF9504isKnjzOYXk647TYZI2/Hm69XGkXvz4CMOXZPuyzYmZgAIJJVd6ToXtxuztUNsTtxSQ8LYyk00PpygDATiBCGNh46A2LkNNlixP9wSIJtT4DP4Nn86d66lY=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="SourceSite">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx7jNfaBspZSZFySXAgzJkUZFB5eW9gdmEkVJIYI7at11RTSN3vYs0FtM5cU2a7caaaVaG0cDzfmcEqP/0IXlURcLPQhcUBfJPAJqeml3EfgVEoXHSEuRMLcvy2umkNcYZJREKSVZvqR09/7t0QxnRCNfAnwJHMA/FSgR1RGzP0Wlq9/TxrgcXXB02dHfEqAtxOzXi0IZY3F86p1yBv8EDdI2pwHnLPp7b17gVkxjDxoVSBjDmvCixVN4XCT7Fk20Iy7uT8dZAOPFynRuAECSlKCdvCUtPjz1JHLRILPYMUK6L6xmrVXHTKSX1xSgOK36XymRcabYG7rFZLHcH7q94qiKLgr0PCBxXqEXEbxb5IW5Rx4KH66QY+GL69Fb0IwqZPl4E53531c/9Sv0zfkQtlBB4o9p2FdpP78nfVs6esAhKXohWFTZ+Mm8bXGp4/+kpKWfvaNEr8hvzXb4vKym5Te98xLvJlWcSjDgMkum3fIdA==</Encrypted>]]>&SiteCheck;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYc5TSqWcZ6df4y0eT0IhWmMRcumyhxuXMx5s7TO6kmvzUpIOjRXn0VGf/4gAkgaCoNCoF4sjmQZYM2woKXM8tuinof/jgUPweBSarrJUI3mDZTmLoUkXUwF3nMa/YlFkhsHqB08IYOKC/9e9ztmIVFwHYQvUDtkVn6LVvDzjUMszWS3K1Xr+bR1+jIKFbbQwU9TWe/LhEMZqVlOZ6hOoeHN5MzXenCKtCSax4pvzq0vHIECYrsfIaEC09fh7o6cvHkvNmZQtDrwCwgIWeHkiKY5teTA6YKj5KKphWx+m56dc44bpC3Hn81cpuZQ9S3w4P2Yt/eJYaAoa9OETHE6mv78Ew9G9xcJ/mSKgEwB+MCOofGzSlzHyj3N02z+BFr44A==</Encrypted>]]>
      </text>
    </action>

    <action id="DestinationSite">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu49vrfPAhEX9OxdZtqnvbeONrSgIrSf+52+N+L9IwcI2cg4NyVl4yB1m0gZeYaC7cIhP5+8XEWQ6fQ9Kpclz6/c1USA+cpTwxWlZALZ2dOSz64wR192wZTTw3l5O6B/csTGoHJp+V0eeAyDIaja2MpFqok5gdQPIM+UUq6HWcH+qX09d2hdirCCryuxNiol1aI+cBnftujj7Ne8DTOKFKCCgVG7ZRWP6bBA/JHlrplHhykGbcydfq5/tt608cTdfOA==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgG52eUiaiQWP9ewZTw6nyOpkaGPpG8wJ0jiz4LgrVlDE=</Encrypted>]]>&CRPLookup;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVNcV/RM/o81iyWlVsVS5+P0gsRVyL78O6iIlV7oPV8a2NAmnTgZAP4jo3gcaSAU/eA==</Encrypted>]]>
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