<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenRequestCopying.xml">
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
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY CheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckTaxGridDetailInputVATInvoice.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$BeforeUpdate$PaymentRequest @@prime$partition$previous, 'd56$$partition$previous', @stt_rec, @@action, '52', @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$AfterUpdate$PaymentRequest @@prime$partition$current, 'd56$$partition$current', @stt_rec, @@action, '52', @@userID">


  <!ENTITY XMLTaxMasterFields SYSTEM "..\Include\XML\TaxMasterFields.txt">
  <!ENTITY ScriptVerifyInputVATInvoiceNumberExternal SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumberExternal.txt">

  <!ENTITY CommandTaxGridDetailInitExternalFields SYSTEM "..\Include\Command\TaxGridDetailInitExternalFields.txt">
  <!ENTITY CommandTaxGridDetailExternalFieldQuery SYSTEM "..\Include\Command\TaxGridDetailExternalVoucherFieldQuery.txt">
  <!ENTITY CommandTaxGridDetailInserting SYSTEM "..\Include\Command\TaxGridDetailInserting.txt">
  <!ENTITY CommandTaxGridDetailUpdated SYSTEM "..\Include\Command\TaxGridDetailUpdated.txt">
  <!ENTITY ScriptTaxGridDetailCurrencyTotalFields SYSTEM "..\Include\Javascript\TaxGridDetailCurrencyTotalFields.txt">
  <!ENTITY ScriptTaxGridDetailCurrencyExpression SYSTEM "..\Include\Javascript\TaxGridDetailCurrencyExpression.txt">
  <!ENTITY TaxGridDetailTable "d56">
  <!ENTITY TaxGridDetailWhereType "loai_ct not in ('0', '#')">
  <!ENTITY TaxGridDetailPaymentTerm "@ma_tt">
  <!ENTITY TaxGridDetailTableTax "#t56">

  <!ENTITY PaymentRequestCheckingTitle.v "Thông tin mã khách của giấy báo nợ phải giống với đề nghị chi tiền.">
  <!ENTITY PaymentRequestCheckingTitle.e "Bank debit advice should have same customer information as supplier payment request.">
  <!ENTITY % PaymentRequest SYSTEM "..\Include\PaymentRequest.ent">
  %PaymentRequest;

  <!ENTITY % Deductible SYSTEM "..\Include\Deductible.ent">
  %Deductible;

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY c "CPDeductible">
  <!ENTITY h1 "769">
  <!ENTITY h2 "144">
  <!ENTITY k "stt_rec">
  <!ENTITY i "4">
  <!ENTITY Tag "k51">
  <!ENTITY Table "k51$000000">

  <!ENTITY % PaymentApproval SYSTEM "..\Include\PaymentApproval.ent">
  %PaymentApproval;

  <!ENTITY APVController "CPApproval">
  <!ENTITY APVApprovalType "00610">
  <!ENTITY APVDetailTable "d56">
  <!ENTITY APVHisTable "a56$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@ma_kh) + char(253) + rtrim(@tk) + char(253) + rtrim(@ma_nt) + char(253) + rtrim(@t_tt_nt)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "2">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "4">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "10">


  <!ENTITY PostNotifyGroup "16">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyCPTran @stt_rec, 'm56$$partition$current', 'd56$$partition$current', '#notifyContent'">

  <!ENTITY PostIdentity "stt_rec">
  <!ENTITY PostIndex "11">
  <!ENTITY PostOrder "7">
  <!ENTITY PostWidth "769">
  <!ENTITY PostDelta "89">
  <!ENTITY PostController "CPTran">

  
  <!ENTITY CheckExternalInput "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/S6DWWSfNYsR9PiXR71VxdUKj3flConpM9aWamTuCRY2stLuCC299soCXaNbOFQoG/rXPLCQR4X+7cUsVULPHmeJjD/azVy/+EINqivZgltFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$UYQ5HKtSK9dNBaTXjfU+gVubdPqOeLv1igtBI2MNpUiKZWer9R+b16/aO2CPrQPeQZO73Zyj8pNLzMsQgm72/aFvzQ7vkNKu3WduW0aQ3O5cRIJaF55OjU9AavMJ7Eo8b093t1cvF2VTB5qi007KlwBue7IQcJ+rEXi2GSJ00bAkwx64+kr2OKtHfPTNcimq4+am91E1myLs7iPHP+noZuIj+vuh7uqZybPc0RL11vq6dTlVSdkw84OIXn3PEihk/cQSYthUGKx1vQum1MpEs2ff4Ku478DBdg1XH0UMXnuckYLJmgQ6/OLzCniq8PfopKq6xIaq/JdXt2VQ6mDvBjqCPdkmuYhx2F7cPl/YSP0aJyDGnq8QUDneK/2FtG1XqIcJaj2kXi+mEVq8XMa17NCIiGae/bbsAkIwdR+BKQCHCXzjIebKIK1YYX5xGjEIRN5nBZpa0O7Z9BhEjvFi067Q2q61J08f94bdARSiB8ATlQ/q4wKxkJvMs4Vjk6Nok7MWqYPwTrnL/MplP8qafi/DvAhrKulDdicav53wNIVgm3sTfeufHIHiZvyjS781FVyrgO3Q4cOdbr1cNRFcNjeSDiV854QyK4PyYgNLV2kZTOCGJHm8fC61EmeOB34qaL+Sgcaq57bwHlRK4JLeolMw/PpmIcT5pYG9EWgbw7JFX8oAVxobdNoXHrlLXJ7Ita5havcdk109U8YrsKz9FL9/Kr+0cNNgXE3Q5iGUcT1Zdn4fdjTEt0V4PwVrr188/JNMnS1Eh1HmRcOk+V91gVpnMfSQJDWAtODy6ankSDE2YqLTeOyomX700VMPxHXLFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$r5mxJdPy4L+ypXLwfaCaTlABXjUM4tr7d6VMGDYxV66wQmO4bv0TjV6I09uDu1TVCW6pPEZ1Mu08fCrqK1hA37WZGQQ/Zm4IdyxON4uCkEs=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8hRs3Z4F8HldPRiBYUhzSLh+Au4038GE+H0lncn9RWR6zsvuqc7gG15NuGbyrvU1JLK+/dKyu/rQTNAXBkun+1EUf/TQ2vgteLHuVRcju/xt8SyNyXhYIOWJVfkXNP8RKYK2C/m1Am8hmdJLEgKgafHA4GLUK0xG+SFt99iAXmtmFastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5ddOZ7SXM0GqCPEdBvTQ+3/6IKctJpixU+BV5f2glD5K186+3GkiJV9mjS+ifJVL0ZdETxrcoP4Wyix/dnpGKAw=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFGqIzO+2dk14W5dcqJF4gyI=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwFNLoLiv80bygdBuYhfPRvE=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$bfM8YljRMnAykVu5Ug5wZ2XsQTsMqICAdeI7FPs5Dog=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$X+vaXJtJ3NF+9gNp+SHCOo37s6uwv98UxKuWJMfJ5Gkwxjk+QW0vLU7rIIdgJOMpXxFjUFubuRRLs3zOx+lsrw==FastBusiness.Encryption.End">
  <!ENTITY CommandCheckDetailInputVATInvoice "&CheckDetailInputVATInvoice;&CheckExternalInput;">



  <!ENTITY f "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0ydOk1MDDz48QQ3nl/IIxUTouGbbB56NusBwp3ogQvpGh1Jclk7UDKvlAEmjq8dxXsw6nK5/PKywmGo9GtAAoZgMo8oKq+X4deiujleWYXn0e20WIzmmeIU2CMWvJc24M3ljepQgHcvMBdAS9bC1nXrqKWh79t4DANCP56PIUm2zFastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCAhg6aWYGigXFcbDM8Mgt5zPNQy+rnu9uuUQxxhTO5zmwFyGrG/pILMt03d8S/efT/55ALR0DXWy5RKfWV4jCDw==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG0zXlmT/X5o5sHm3fx0wwsjNfmt4fDaLNEjyFUIXEPNQceZl51EUAHanM0qDvOa2Jdfi8wz4YCxErwCN7gkuoyToBdlEJTtvfAzBbP8jRJ2IAoAQ3Fm7xEwdJ7OTAkTDypm3ri3EdOH7yhjdwzLWe0bFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$knoOckCk6knYGNO/UXETAzxNorSsf/WfjJv4XJH4EpyOJFsJpkA1FnEw0+uaC77XIhr9gHBemhDQUPuzBcwPfVi+yfPS+k+hauC/YcqnrCaD3C5bTQYEr4h84nNE1d/s8u75z0gHqulCV/x2M/P4gw==FastBusiness.Encryption.End&APVPostGetStatusNext;FastBusiness.Encryption.Begin$Eo6wOI+nr7h2is8uSCzTQlYC3bgi+rznsyEkmCcM4D4=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1Dbick6LAtk5oYCMAU6Lzv/efi2AZILWqTJ5lRUlh/rrGYlRrKvYjnlfkDRaaQLTT+XbYjfCfAW7RLJEdEB3cSIrXA=FastBusiness.Encryption.End&TaxGridDetailTableTax;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcITQTlB7Ovu7R8DcSsYDMQE=FastBusiness.Encryption.End&APVPostCondition;FastBusiness.Encryption.Begin$9bBXgmS4IUqbn/cYhF1UTEik6IprX+VGjR6B1rPDAuj1bEUl+AHw7D3hkNGP3jk0JEju64p/DFuoXUuvUhRJwXbR6a5bOdT3JStV9KM+uCdlOiGU6RBK+WnEQbi1qEn1kk/TG+zRkPQ8io7XH8Q8tg==FastBusiness.Encryption.End&TaxGridDetailWhereType;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZaZ2xxNsus5WCEhdkxjbHzcefuI5Ld8dmn0bi8eSfo9fpf726Gg+SZCvMgbCkte8g==FastBusiness.Encryption.End&TaxGridDetailTableTax;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22Uc8PCIngpJCx55iL9VgG5+zozTcVapBOJo/2arQ+vceFastBusiness.Encryption.End&APVPostGetStatusNext;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHuC7UxDArjB3p8UNSGQIsq6vZiTI5mB9o90DqGXyEnyZGPWZzRbUiDWLxVMm91WrfrG1CMCiAyY6024PjP59O3IU3l2ihDbIM4b8BGl6XRR8Km4y3NA/U4wieNurKWIGgR6qxvHylbvcrOB3PBaCeiB6507pKgB8t1zDWgPFKX8Hq2iXrqVP+gZOPBKfNVd8fVdZx2/s1jZtPY0X5ByFDX97zVIztH4321tN+xSD9E87vRizIMeN+jeOjgX/9zKdJHvqoPmCksFX+ByuORqhC6k=FastBusiness.Encryption.End&DeductibleOption;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4faKNU5ZoNjfeuXdqiFOqNvXJR9WhcrWOpqoTU9OzB6V7gIDThizSK86UuiA0OBES263R6hiIjn1iNp+1HAH/Ix/2QAn/Y/1EZpQllyVxPLgggGBARU6BcWkTH2KOOoSQ99EX2r/NjxyphrkSgGXfQM=FastBusiness.Encryption.End&DeductibleOption;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WOKuXudXrKyPRxH0sEYkHZlyN/atoxLWEc0VjZzP+eTEoZ9rMrSgymkQyHxNECL7Q77I0upIWExsDDnkiFg635dkCC1RKEwXndtS7uLW27j/YOdz8MXnX0+u4zAsrbV5DU+qhH9eXgLFKZtGacw+Tl2ItzD65wxXKES3J7/RA5BxjZXzAC1xDbe2bUniKw5Ct68MeVefEyc+hpUAjnaa+o=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifM/+VqapwAfKVezvG0zuLHSAKcGhKTlgDI12W+tFKfasHelOivDpsFHyDXOxyX8vd/NbZgkt2SSrtnPhPLZ1NJhJANJOzsgFpHJiCmg9NqivOfF9cYBmexSr84TeW+b9X4LeTxbn8Lxi1tWgBVYuvUouqGwAkM6isl+njm18jLFKgUJ01QABs3uynb4tKp5IA==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXSsA8MNHKsJ1gqsCW8zfkeCLI9UMD1CvGsvBFI9v2YhQ==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3hqKphew81XOcqNszTkiBR6QFMtdosKn7S900/0wB2OYfYV+xEEjPJ1rZKKtBXH2VHiWwYVQUczolxg4bGs2pvJA7vfzC+xGZPpFZ4wD3gd/F0HMGLjlEHM0sQUA5LSEZXjfIllZCw2YIs7YkWhtl8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSEoXq01bMQnNA7AMkzvaA9TEhqDfI4HtdlDF7C7pcRPNZRTWAmC/cOtyNex9OFuqTlTTCTT4f69KFJpxcisJLRnUgoPlNJ195B6paHFEW0wzwjOhwWhNjRRWRaXZQq8pA==FastBusiness.Encryption.End">

  <!ENTITY CalculateBookExchangeRate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5teddOpp4IPAroYCkT/JKhj0QXBsyUYQ70ObM6+LeIptpVk957tE1Q0SVln1g1GVWMOAN15T8Bbgr3B880hNxyfYIqyca4BFx/WyeO2PDZCrX4XANke46dzeHuDFdNwYLxuzlQQjNZ8VwK05mBsOe5bvk8qs+bmpwTRoWTxP680hI+YihxQokuHuQtXqj1FGHXauBbuoC/bOTI6zwodRUx6lMhW/K5Yqc5V8mLUvSUD61VbBUSJHPHwJEV6FhmNX8bWx2GeqVYwxTdgND0EoWf8MwyINUs9DZ34315CBiy44vNj+iRHjqxFkEEfhUhbmz7D7GgCzxJ0LM+HJ3H3XUS/N6HP9hBdXlRiRjlyjgDGAu1pqyjZSBy7qVMoO4sYZzvMpdGx1714VmRyOMxOeTDuuBJ4bUKQ7B+MEqmYofrtn5+r0MOfyE+DRFVLppx2FphLrXCNRoiPiari2U2gj3w=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx5hjOaO4cpNFHBJ0jdvV4NN4aSP3K/+UlV+mvnzJok2gcX3Sfzw/V965ytgcZS5ZG25FvGrmgeSf6vtZopGqdNQJw6I0B4ipHC7gQSsZAftSctV3+v7gBYmbVV9rG9+iM9qXoV+xttGjW0Mj433BH8KF7R09gAlsf23aS+ywryVg+dhlRAE3psOEoueb+BL6Iw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkPFeT1QEOZn4NDTM7BYdS3f4kX6k9SqfLnUBpZTC3XvrBoms/r2UO3XbgvnlmUV6J23YOfpdIy5cnSijvEAWCO4O2zgmIoMh2jnVLoU3OWr2yRGrNxWPFoAJvBABO8ipixUZj0W9UaDN+0yHfNLSTe4TNQFMiVSYTYSFmGLBe7kghpeGRbUoIo3nVbYdadwc6vEAb05vzau4+8fWNedvfcm6S2PBmPEhoGzikZKcKcpP7riL+63NmInxsyvnnFSyYGS+oRt7scAhvIhN9qYJbkoORRbt7eNgo/Y+S8hsHHqcv8V2IChn2c5onw0K9Ox2diTPmlbalZpGiQonole8WUa7vw/MMqMNpTIQZGn9PQnCqOsxv5ZMxhzDb4Q8Ba+ikJmX8GriJJar4/cCIBQLW4Q==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13rBXVZcEatZuZc43xziDgsnk4AtI8Ytuf3vtydN3Z5BLK9cu9aebZcCLyQxKkI1tnps7qWKnQLEQtgydp7H6SHk6CBEQqt3zTsQdog1Yf3nkdKHAvkvYfGYrO3ZBIju56Hk0OdlYxA7Ax23HZGF/SDbvjrHX5rAKh0auFYXBTn5ZxHOwlH9kuskXtmL2JZIMDV+Hu4XNoHfQQgVL8Z0LxcIm7h+ZnUMSa7J6oylCPpuFuI+nCXoxcitWkzHI4W7j+DW98qV+GfLVTaROL+BHy7wBj9F7OmfuThL7aQ2SxE/HA6ILEebBp1Z4UC03cMhQ731r5lhvIOzAsGboPVq5r02QtLDDE6cAdhPRCnlNiIy3A97IQc0mlShOQ8FUr9uX4rBlUxHJCT50HxMTM63ABSjcsj0nT196W2xUC+6E/Qy/U6qdbolt8qpYIXEznYFgs5vB85dzQdhYJsoKWK8Teq5RzQrlry+yPB4DJ1ZGeWWeFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$XpMwRlifXC+7LVgM1zIOlZS1irsZ35Xvanwm8uWCOHkg3wUJmyvhPORbV1aVcuPqFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13mT7HE0VslOmcESTENtrMA2zaLRPcj53Oc0EypzdRSNgbnTsUE1EifgZqep7ILQSj/5nneWMzSPlZ/MReszxTKeJlTzflAUws2Rylq0RtFX3hxfcj7ff1bI7GOwDz8CWDaAgipRtAaqyx4xLF/2pHRuUqlvMxjRLktIJNpNfLcDE+MhI+7qVnRhU4NbB5jKWJZOKrqhwUrkyNru5iW69/dMmhbaP/KDInYvTpAtQeH16OAbBBizR4frVOcq+hJzWSczS6meBYzI4sjvbZXD8QDb0w5dHvvI2jNNUuTN4MXWEFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ftRT+zHulynPZ1EjbodAkCtViXRgslKNyPk8l167u1Ld2i4Fm1Ppv3v6tikUxazBZKxqlhP62xoMZV+2ezGfQDFh3bJt/ZTwEtdCX5C4KXUPK/KzdTJD8sPB9ZHSawcq355ZMyDJYZf9Df85NjKhlKv0i5Iwb4iNx4ylG8LJU4wbwS9/sg/szTmX/loOEPbf3Vdg2eHtvqAUaQqAmMTjA2ONty98Ta5Alipve2r4uiWEmw4TRLmOKGu4s9gZrYShtRYysWsCmLKTOUgGGbrhQpgkXPTPXRVnOStpod/YKedKbZiDktp57Jxv7q34Xeu8MUgYImncMJqqi3bKfMDGsA==FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY CheckTaxCodeDetailExt "
if @loai_ct = '9' and exists(select 1 from @d56 where ma_so_thue &lt;&gt; '') begin
  select line_nbr, rtrim(ma_so_thue) as ma_so_thue into #d56Tax from @d56 a where ma_so_thue &lt;&gt; '' and (a.ma_kh = '' or exists(select 1 from dmkh b where a.ma_kh = b.ma_kh and b.khong_kt_mst = 0))
  exec FastBusiness$System$CheckTaxCode &CheckTaxCodeFieldValue;, @t_yn output, @col output, '#d56Tax'
  if @t_yn = 0 and @$taxCodeInvalid is not null begin
    if @$taxCodeInvalid = '2' begin
      if isnull(@col, 0) &lt;&gt; 0 select @$taxCodescriptConflict = 'var f = this;var z = this.getItem(\''&TaxGridDetailTable;\'')._controlBehavior;var l = z._getColumnOrder(\''ma_so_thue\'');f._errorWarningObject = z._getItem(' + rtrim(@col) + ', l);if (f._errorWarningObject) {f.focus(\''&TaxGridDetailTable;\'');f._errorWarningObject.focus();}'
      select '' as field, @$taxCodeInvalidConflict as message, @$taxCodescriptConflict as script
      return
    end else &CheckTaxCodeTableQuerySelectWarning;
  end
end
">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;
  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CPTran;
  %Extender.Ignore;
]>

<dir table="m56$000000" code="stt_rec" order="ngay_ct, so_ct" id="BN1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giấy báo nợ" e="Bank Debit Advice"></title>
  <partition table="c56$000000" prime="m56$" inquiry="i56$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dia_chi" defaultValue="''">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận tiền" e="Receiver"></header>
    </field>
    <field name="dien_giai">
      <header v="Lý do chi" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>

    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Loại phiếu chi" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu chi" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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
      <label v="TGGD" e="Ex. Rate"></label>
      <footer v="&lt;span id='idf_ty_gia'>Tỷ giá&lt;/span>" e="&lt;span id='idf_ty_gia'>Ex. Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá gs" e="Book Rate"></header>
      <footer v="&lt;span id='idf_ty_gia_ht'>Tỷ giá gs&lt;/span>" e="&lt;span id='idf_ty_gia_ht'>Book Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        &APVStatusField;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d56" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="CPTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="3" filterSource="Optional">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="true" categoryIndex="3">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="true" categoryIndex="3" filterSource="Optional">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>

    &DeductibleFields;

    <field name="f56" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <label v="Phí ngân hàng" e="Bank Charges"></label >
      <items style="Grid" controller="CPCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="hd_yn" type="Boolean" categoryIndex="-1">
      <header v="Theo dõi thanh toán" e="Payment Control"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJYsw8MgVJF8llh8nasSg9irUUqUUJilQAvJcTSxGsqm4fEFF0rHh1sl206GVPwGozt3N+0zZfCxUh8uUGFa0nGI=</Encrypted>]]></clientScript>
    </field>
    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ten_dv" external="true" defaultValue="''" allowContain="true" maxLength="-106" categoryIndex="9">
      <header v="Đơn vị nhận tiền" e="Company"></header>
    </field>
    <field name="tk_nh" categoryIndex="9" external="true" allowContain="true" defaultValue="''">
      <header v="Số tài khoản" e="Account No."></header>
    </field>
    <field name="ngan_hang" external="true" defaultValue="''" allowContain="true" categoryIndex="9">
      <header v="Tại ngân hàng" e="Bank"></header>
    </field>
    <field name="tinh_thanh" external="true" allowContain="true" defaultValue="''" categoryIndex="9">
      <header v="Tỉnh thành" e="Province/City"></header>
    </field>
    <field name="noi_dung" external="true" defaultValue="''" allowContain="true" maxLength="-110" categoryIndex="9">
      <header v="Nội dung" e="Memo"></header>
    </field>
    <field name="phi_nhan_yn" type="Boolean" external="true" defaultValue="0" allowContain="true" categoryIndex="9">
      <header v="Người nhận chịu phí ngân hàng" e="Beneficiary Pays Costs"></header>
    </field>

    <field name="ma_dvcs" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="serialize" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &XMLTaxMasterFields;
    &APVXMLFields;
    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="204" anchor="5" split="5">
      <item value="25, 75, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="10110-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [tk_ex]"/>
      <item value="10100-10011: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [ten_tk_ex]"/>
      <item value="101---10011: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="10100-11010: [dien_giai].Label, [dien_giai], [ty_gia].Description, [ma_nt], [ty_gia]"/>
      <item value="10110-1001-: [loai_ct].Label, [loai_ct], [ten_loai%l], [ty_gia_ht].Description, [ty_gia_ht]"/>
      <item value="10110-110011: [tk].Label, [tk], [ten_tk%l], [status].Label, [status], [ten_ncc], [ma_so_thue]"/>

      <item value="1: [d56]" />
      <item value="1: [r30]" />

      <item value="111: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-1: [so_ct0].Label, [so_ct0], [ma_tt0]"/>
      <item value="1111: [ngay_ct0].Label, [ngay_ct0], [ten_tt0], [ma_dvcs]"/>

      &DeductibleViews;

      <item value="1: [f56]" />

      &APVXMLViews;
      &ListView;
      &PostView;
      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>
      <item value="-----1-10-11: [t_thue].Label, [t_thue_nt], [t_thue], [serialize]"/>
      <item value="-----1-10-11: [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      <item value="11000: [ten_dv].Label, [ten_dv]"/>
      <item value="11000: [tk_nh].Label, [tk_nh]"/>
      <item value="11000: [ngan_hang].Label, [ngan_hang]"/>
      <item value="11000: [tinh_thanh].Label, [tinh_thanh]"/>
      <item value="11000: [noi_dung].Label, [noi_dung]"/>
      <item value="-1100: [phi_nhan_yn], [phi_nhan_yn].Label"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="3" columns="100, 100, 553, 0" anchor="3" split="3">
          <header v="Thanh toán" e="Payment"/>
        </category>

        &DeductibleCategory;

        <category index="5" columns="769" anchor="1" split="1">
          <header v="Phí ngân hàng" e="Bank Charges"/>
        </category>
        <category index="9" columns="100, 30, 70, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5" split="5">
          <header v="Ủy nhiệm chi" e="Payment Order"/>
        </category>
        &APVXMLCategoryIndex;
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="25, 75, 100, 25, 212, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5">
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
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvn/0+uIbbw5qT4cRIzkMb0MzheDW3QKPL+IKvp2AIPiUx5q6+/JUY+jN1nQDZ39Xj2/G91KJnkjxQz1iZG3w1C94CPuICumnzuONkNE3O4fMrgkVWYmIT3pIF64zQEZNaoNBXpf6V+4+V4ZXuqn+mcNawlIgo753K/US6Izuby13kvR1CQ2ZqSKeQYFeBO1WG+KSusRjrdtSM9JO0G8j0/4E+SVVre9Ab+L/6OVz9NlGoAqxadNyyW1SPzYYfQ+Yn6cvDRVfFx8g9s+l2EDwfOI</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafR+bKWVWmz4Rj9mCyraOSCeTVrvL689/26d7LKtAE4vo0Q8smrLJVgQbPuzmkabyag==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhMl8wByWGe6/vPAtCPJF+mhotgyrworBSk08vgNu88bzVl7weG/NaFHDPqqW2yVpN7022HFbLokruqvtnxMyuh1iBJd++yCCYi+TiEUpv90WCZeeAuP0F1UwcxtVGOCOm</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgja25/CKYoVnG6NbMSTqOa2WHsZV6QaseAnpSS1wXTh9x1cpNc03uvgYV5jR6N+rfrndZSc9gpzyamP7X1nhS5CKn8EDLWQ2hpHqEBrn4EwozwzG/Pkz8oASYw5SFBi2V+AfCmCQWdWZJ/2Oai7agzKyVnt8m5NLIR9zvAEpnJ3LHmT8AazKPYY26Z0jp4XLzIZ0jAsi4AjYre/pU8H1iWBh/1Km+lCKMDioSX2rSexvDGJ5vKQOP/dooh63JLKGuBdx+ZYBz3uikBKwo991mAi2OgYdJn34AE3Ng7cm2tZdc7tJ0WvnVTGK6rYYEDCGY4=</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandTaxGridDetailInitExternalFields;
        &APVInitExternalFieldsDeclare;
        &CommandExternalFieldQuery;&f;<![CDATA[<Encrypted>&Yuq/FeUOF6NbpMQUklKMNF4/K5NKAzpwZ0Qz2iZi0/74UciHjIlDtVMIBTtrA8CfW3ex6m5NZ0hYmieg8pX2a8FEuKHtgAX1eAQQzsEC7NNJK2kHdStEHeRDJJlbi4oe9MQe9SEKTfp9FTWMRO3qqksdDRy7XjXgzrhtrWktLp7/AuraA7L8Gil/0nlNQXcF</Encrypted>]]>&APVInitExternalFieldsSelectWithComma;
        &CommandTaxGridDetailExternalFieldQuery;
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbHYzniaW4dq2tDjay0JKhF9zZFE2PmvEdsAS9EZRLmelGo1T3uBr+hl8DF1jUgDPGoPO1yJfE1NpZRgoD3r6z4grV6lgzefX4ZI3s7hjl9hMr4c14YPE9cGCXbufa/2c+FBDa6vER5yHJMj0Y/m5d3TDrVLGzrjni0reKiwqSEZ0+gkjqcfg60aPdp60ioeWcIr3i/q5jDqXESLE9u4rART3rKLrsDHVSCUArkYCCmBUVW77aLuAqttlnLd5xQE+9fmyl/ZCmb7wyDocFSjZHBy2DhwEvk85xDktMBl+dli81NHxA+Vv+opGo1+TPywn+tmm30SNAScoctQr4HipaJDcaVKtccrUCAMVPwtUcRUkTNI8IXePK6IQ0+4IeV24+NDpTWPtKoJF9xG6tgY3HlWQD94pxCT4w07wYLbOL0akEd6Ks6rkLRpb9zDqzNFXtiiV3L4gKKlINXg+Cg9N3Xuxlrz/uz6+Y9fMys6/7vXNXiVclcoeUX5lhySg4ppTLkAjdgM691brTXHLea+W3CaMv0D330w5e1Xq5JFUGJ0U0taejtseMTGmXUnRLuVjaJxDCDRH4XowZk5HkaYP+yjdNOinmfOrU+4mERbDWkrvO5K+MQVNS5Q0G+I/T4yAi</Encrypted>]]>
        &DeclareDeductible;
      </text>
    </command>

    <command event="Inserting">
      <text>
        &APVCheckApprove;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckDetailInputVATInvoice;
        &DeductibleInserting;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+TEBCN2QrXG8q/tDwa03HjtFWZGR4Rd0EeEZJkYx+7EVJYpSy8lstEuDdgTPS5T0nXgNLCK8mAjaQBPRs4KzM5/CcGyFZjnP8/sOCd0TUIfQiH/zFobimKrVuGS9RLY5Af95sR9TqxaaGDsk/E0aUF/B4RivUeC2mBBT4vJvOBmg=</Encrypted>]]>&APVTaxStatus;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcpc6xe17YUS9J/fxlx5c1aHQscVbJp0TOkSbu4tAhG0E56NrYI2HxvYRg9co7F3J6y2TPOMlZSUoc5Kn/dkLJP4=</Encrypted>]]>
        &DeductibleUpdateVariable;
        &CommandTaxGridDetailInserting;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOv8VZjogAk4dURfxtnK5LNXqTl4aqsGT0yHlwJDQ0Xr/7EkbOSm8uzxj0OqFJzpjsleN2s7qELGas9ZWVNa7aqE+hR/YT4Z5/hNNN9U0j/G6EXy1fj33OiBlr/RtSRzKoS6te5RL/JE5kxSvkvBI7QXY5stUuJS9QYpVk3qnF8C</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEQPosezwdtK90mcmi4xT7UJlR4oulikRhSykArifMKIUuQy9JcDRAGnuPDr38DRJ6+13SJf78Q6J4EAM3FhZFhehQziKxouNcuOq/OZUTNR</Encrypted>]]>
        &ListDeclare;
        &DeductibleInserted;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveInsert;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &PostInserted;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX1jx08uZVuaqldj6SW7K3SJMvpN8bZpxx4uP/JV8cdiJ39FgD14A4EeBl31lSuHjmUHC705TuhjfqMyfEVJMxt5r742Kgkyy8cjbJNqC0V3A</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Ke8n4vPs/ehmIOGgPHPqcMEhqFAT/BWR9WpMhwyr1bcL/bXh09/Q891ozl5l76y4JVkKGj1yP/PqFiwA6WE80nKG0SnTKQWmC9u3ExHAzWWnTGr5FZX4ubIEYj61aay3dfz5pdJ5n3MLskDFVJ2QU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &DeductibleUpdateting;
        &CommandCheckDetailInputVATInvoice;
        &APVCheckApprove;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDum6oeRWvW/KZ/B4m76lkFxzatd8LehhuRyj5a5+zQtLbGb7DH5NlEN9HLnkSVTW/Ub+KBSSE0yn4x+nnXvQmTUAkC3PF8422wmrZFYEujuDQqNaEXCzi4wwQvm6bZuHLDMkO+iVmgLjFOGFSrLGbdOw==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku05T0CaMhGCBlWIguTieiyMzME8/WSaPDEeuek6bLmJCOcJFVMsQsrYrmXkJ+LgzjfIBV7YsRzGV2AMTTPvzDd2I/16bPM9GdMKdtRwr/iHdtrzk4zA5yQF04eGzXMwZDg1dEtfeYf/9Rjsj0PsK4lI=</Encrypted>]]>&TaxGridDetailWhereType;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WjKvkqb9h7Fbg3EpXheaSx4LO+F84/73qkwd4Rrej3oKqvoPhIcYR+xvtpszous4LpEx6b+guMUBCgNzwG2EvoU5qzqNNGQzkec6n2VVKqZ+TkpzBaXm0B2leRWjmKHDGyp0goP5jVxo0f5kzaHhZ115Zs6NWmhtftiFDlq1gkkBQzNPou1mtnNKoamqkby4wuO+VMwEg1QXRIgxivXRDJ9S8TMTSm6BUNeLQ1j5NBoSar9XY4gAF7gB8y/I5CTMcnACsQvnmOeK/Xwu0qiPXiyoeVWpx64fYuot+qh3VB2nx17/0cfzNqveaGSWz3ZVg83fPhHCnAcZd+tNE4mbhufLfj7u9cK7pyCQ/Ppcclo1UM/kLXoHLWXCPCyylOObg==</Encrypted>]]>&APVTaxStatus;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcnlPuF++FQaz6MzGWQ1TMXxgw6yzGoNLKzww1npe67T2Q/whqdxEXXdnSXzvCbrWihiBhUs5DFL5V4SZ/9F7rA6oDYaiS4TIJaE31G6IXaaW</Encrypted>]]>&TaxGridDetailWhereType;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WewbsLXaFFdDrXw5epIQm15Z+iSXaaqRoKoWe2/DbC9wRSMnbJf0ePzglnfb2OTdkLjsTf+I++HqOCXeNUJtIIPfdwgiGJiL2im4K/10IsXAoxwps1y9ZCaqv9dlRWc5vQDVnI/v+J0o3aWx1G3XFPdqjCBx6cb8NX0TmPaCa7z</Encrypted>]]>&APVTaxStatus;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcnlPuF++FQaz6MzGWQ1TMXxgw6yzGoNLKzww1npe67T2wb6v7NDbqbrTO/1sDkFyvuqU6uIxioa/VwTFuMLJ2RMuRTt2YdpLYLCx4VWW22WPoRdeDLPdpzfeO3xXvCvrIiHjL0E7KG/XzKJEE8LBc7iuKiAL3TtRgkgTJIa3EXhawmhm7D0v0hSViS0VBCIaHlXZdE8r+f2jArDK6SeNlvsnGUumQydQ938sUqeX6gn0Da5HpTWnoAySMfYXs6URfYj5QQaKiUqdExwoe8aCdKMvZnGqt6Mx2gzORe4KF25womDC+Zozuw3gRxFgiibFRh9SiGG/VjGpUk9OQfb6MyNjZ2yvuuDO2Idlz45YeOLJlGUPyt6GuycdITcTjLgI0A==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fuY4L6WUBPKLHV2jOcpd9TptGTfmssBC8zQyID2Nd5yDbeU+GlQeIkC3At9AmMhcGHZ1MTmir44pYxyXBvAR4z/6TAaq9PUjnXQB6UcGrC1KKzC/9X4DilTZaXLS/gLrQdubuV1Lz5eW53hKFJXNyDVy/Sj4djY0V9JJfQy/WcsRZuHXonw1VkWBtVWGzL5SxTNhpxwnzgkM6gVSnaQ4rA9G9NXldz1SB6Kj/DcwFrPALcDD38qj9h8wQ2l+YEQWJZjodhayfFLNCZ/DLK8meA=</Encrypted>]]>
        &ListDeclare;
        &CommandTaxGridDetailUpdated;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveUpdate;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &DeductibleUpdateted;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCEI6oJLQbWkY2jR385jsDpandBkYA8tYO4Ie6g6xWb7GldVzu/YXVMnI7NmpJ7G8vbyFyYNRKU/iAa+g4xWbW8=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ01+OSZdDG39YiPtd29YZ6nuj+6nzgq7KWj2ItOQkHDzRFhJwtfUrG5bSzUUWdnFB3F2t+6VVl8pZapLeS47/qT5si9noftp4Vyq6xhmG2sWA</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDum6oeRWvW/KZ/B4m76lkFxzatd8LehhuRyj5a5+zQtLbGb7DH5NlEN9HLnkSVTW/UqWlb/SospHgKoAChhGZuwi0qAGnOqnTMo3WtPN96aysoQfjnjOw8eGA/5+v2kn5D2RiuxaFXAdtHihHy+CUJ7Q==</Encrypted>]]>&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLOwnhINpfvGkcvmE1FEvm3xPmLae5iV/ZXHDZFI8VoORLFsH4/zn3WdHgeNqqOx7CgRLok5KpBHeX7lQPmbV5vg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2WS77E/Rf+cqKjntEgoM/QPhHsxe5ppXFh/AFw7uOBB+f1E+bxE6DHVpnx/nv1kU34SAqpNLmqkV/TTQgWIHDs=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0AYwazv2q9VfgOhuYFRYqw2J07AbSslIQil7o2/3kPxWtuXMH7dPV3cfUAWoTtGbFQe0SetxO1rSu7HQViy63o=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz4/dUeSCfWW/8iq2UoiJ/ZFG7UtrN1Xz7KvmavJxJ/ChXmFbWsu4yyZ8n1098vC/Q==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &DeductibleDelete;
        &Delete;
        &APVDelete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rdkOkg61grDm0sOXEFlPL8iiw8dXq+dJyDxaNC0ZzoDlN8XHFce1f9AzRbJHRHHXCBkEZv82LsywhCMukybTEjLZX86v48gdaH2J9AEg41lo</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkARvnFQ1M4TJZn9c8UBeuwmpxjuvNmSJyuNAd4VWBl5wXdQoL70RPDcpQR5VMVusRzR8FH+qsCSJftrkt5FRG4ST6brp/zm0bWGa1fbbGI8VbSOEIIKt1AF32JzLupZ6ThfXI22Jw/b9S6MhJjfLdY90GFZwlZiszaWpJ58v+IwRdQ37A9wKl5mSlYs8tuuJXvCERQB2z1A5ZhzTffgWgWcSLwd4Vb0smAGRywQdBWpIKVPiEZkdeMnX2+1RDIfbcXPkXATV1jpi7T/QIRP3KahqMhGWKkJHml+ckgJp9TrofAHIxyt56vJwee4HC8b04P0Ikbpy4RKlzwwrLKKfStiUfS2cJTp2eKELVKVoqUpZgtfGGeVI2nO/Vs62RkoIKTUdFS4SPdF2Yq7tdNWaIfJgecWBfw8/iDCCuKWe5bvwywbMW3Jd63XsR5jfPQAjR9+L8U7AwcOfCmXtkme/e8H83UtElxa+H/X4sp3YFftp4dFuu8vN3H+YYWwOcFjBBUDHUzVGs3/YWHtrnKUvmFHf0yHujDMbUoefm69wSSXllmFyXH5pDHUW5FOlqvzOSOeDEEmYvT2JM4u2kjWrbkQavQnDdFFYW6WlILzDK1ZW6NxCnbnta2l2B5f372am/Y=</Encrypted>]]>
        &PaymentRequestChecking;
        &DeductibleChecking;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpkYx3sBKeFvn5xF7ZfQgDKIcLM2heSpZT/z4Yu3FikqpiwV/kVvGT8jNidhhdtcwNnSPIfpTzAio0/RN9m47VxQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V4JMgLxmlt9dSbVFsjGp/axWOas/Ij0u0CYZFBrNuA9I5QgNCDtoiswNkWhPlZWX5Bx2Io1dFFAahfe3FmKtx4rldu1nvUf7bfdsBkc/iQPjuU+N7MKazqb4KjMvOi0/nBGvJmDd1Z/yl6D3+eXe+mJ99dhWCYA47FIKsWoN7cH4ttvLXqotgO/ONrcrAtRniHjI1mIC6OkMNQ8YEsetKqs+V5O59nCXU7ujt8YVIjWy2MYGyRdYXuc5V5idup52NviHyRx5Z9xqx635cEFm9tN/CdgrjqfkZ+oh3DvmAbK</Encrypted>]]>&PaymentRequestCustomerIdentity;
      &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&ScriptScatterVoucher;
      &PaymentRequestCustomerIdentity;
      &APVSetReadOnlyFields;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cY7ieXmmW5fc8OBs6idQ9Sg==</Encrypted>]]>&ScriptCloseVoucher;
      &ListDispose;
      &PostDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTt7FJRLJ9vUV2jZcXIcmjX+n8/86g+9YIKOlXm/9f8xVjzXuK8xFsAaqSCkYy8f7AM1bbZFnuDy9HoqxyUNN4l9KlfoT2ldTokZD/kI769+SVl3r0yrhqmYJKOabwg0MgY6nIZgPLCan+FUdQN7TSgO0Vm9NY1DZs40NMm7qaov+U+nq7/8aKmWLFt2mje1TQVpyN4a488cg/GK8jLviOQjw==</Encrypted>]]>&DeductibleExecuteCommandVar;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf38G6Y+xJqoTAPng9QYEX4qU40ZN2k8XCTbO9YgjYdOdAXmAsz5JSblHYNT3Mv0/Ig==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RUVnN8nLLj7AXX3AAs96q9v9yKZH7V8OwPU25dcMROI+w==</Encrypted>]]>&DeductibleCheckVoucherType;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VNXeCGqDNLFmcVTETAS2n1qp5uw3DOUzGGtGwk8cG00B0OkCTn60mtW45KabWjfu2/9VTNbejIuYI4IoxP/ZntM2gLVV0HoQari7Uoskjcd86EthIwHNJ3tMfVK5t+PyYSXSVSAQmSDfpxhkA9plRcYpR/2VhZD6VToqcRqtvJlBrHTDFvpLv78QPJuN4vt2GHknoZfGN4t3xnvJOjf2ClWEAovA8RT+UVmoRGPAfIlOXzQRah9tVZM+q5BI1EV/vrRES7pjOjHP94sSAlo2vc=</Encrypted>]]>&DeductibleExecuteCommand;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAlxF/yxiM9zOkKp+UYSxKLUdQBt63aMLDK2XOItuwrwzKig6DNRaCs6bYdIyKD35o</Encrypted>]]>&DeductibleExecuteCommandVar;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf6ZJZIcNuOAr3UDIMsl5kmcdpqtfpGxIG7OpgomjJPaEvLzeN3330PzZ7tGhdA/WK4wfBz7ctsnAbiDkWljJbPZ82+phCgwo9Hta6aCZmJrEnDph46/3daVtO1rH8fxdK732HLnLRCf3EjPbQbiqGeNIcEBxBKyQCN5FX8ZKI+dVjMC7epJRC1Wm68s9qyIOUWGpvLCDl6hYklsnExPsLCQTxrdSMSwfL1gFffC9ao/yyu+ZaC+sa4OTnT7vfShXKPloM06U9QU4knZ0iOo00DewLfSALcE6FQhCJEmZ+wFaRYx86oKZIGS1U/6nqYQYVQOQBr36WyjntHzVUVGhP6U=</Encrypted>]]>&DeductibleExecuteCommandCurrency;&ScriptTaxGridDetailCurrencyTotalFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WO2x0PzqIPvQIyIdiWgwvW0OynztEXBPBMI3im5r7JnQWn8b4C9LP2hNjJjcSSrIw==</Encrypted>]]>&ScriptTaxGridDetailCurrencyExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V+XAuBD7JxQPrOftIQGAOpTqne3TBKD/XYAu1G5+zH7Tq81veYuwRmGUT0a0FCOE0qXrI5TnkZeCzb4nD6XZLOb2IdgQ/U3q6sfyb6oEzYoPEwLWtia6rVg2kz9wKrJfTgWP4/n1xjb4lX+LBAWzgYW7+zSfZlb/70cHWwT8CRKT3vAXjlFL609CSHy6wdPu0iKPOvR40uLbRcZf4hlEeCdFe7oNinjTX/d5UtzrSi5GZ97M6ZhPbxt4jvo59ZaQUhS+nzWwzzmZrg/opQym0alZnw0RTyUGelRRcjZYc3S4V4Kd96w3IcQILVG8cERcRwJhKkJonlAm7PdC5E9A/+T14bhkA3pQ/4J6h/CoGGjJ1bQxYI/jVUbaA2MHbEVqwMtvE9jYQ7Ck3ISkBbHYp1sQpyPvFxktwzBKg//Tda5FLY9yCl+IDM84jy9uyz+O2CS21PrV+2IIHtpjx+F/FMxB93qFtN4cNQxXqtzNB6ty+tza459B+AEKGZT0xoOcgG8mKJRRYEjB1hk5WVDW+384OyhdV/ABYpycoL2mqjwmLNCubrnQkGvTcYOg9kHnQ==</Encrypted>]]>&DeductibleOnchangeTab;<![CDATA[<Encrypted>&Sw6sjVbLhpKYGdpAHZEmOveijqpQ0nhqKnE8/5KxPJjy2GUCIzcnSOCyZdIl4D5AT8smYdz75Fn2VHMOlfjFMw==</Encrypted>]]>&APVTabChange;&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHUU7b9XqwycJ7Jo+VEwaVjh5h1/Tpcedm3OmLle/nY4ldx09l+tjQUNZak0jLHzDA=</Encrypted>]]>&DeductibleOnchangeTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/787LcaI1yOsppJC3nFiUaoEc49gs5SHKMJqCTDTeL2lXn</Encrypted>]]>&APVTabChange;&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRHpPOWArHErFvxCtsL27NicgJv13ZTazWf/ob64xZUln+5dSqGe7iYy8c/fksxhDPObbS0OSO4oFaaL3SAtaK5H+nRaytKSeoAZEGmn0hqofo+xzLMcxqBdj7PJwkpOyekwVQ56iT9CrnOcgOXwNAHVhRljN9qfAgv9orTpiVcHJwabvzaQuA8QpernulBmHIyB2Ehr5kFEmVaV7F4Zzbo2V1JOGYMrBN/tYwpMLv1ngb95vAXGbeZ50zBcW/QXwjPY/ir5rFMJLdVOo7KGUg1gwybKbAinxkyAT/uSaNdppPeU3Uc+TfGebJkxKh3ExlGyfgiVyqIPB8tcyjDTEBBV+NfG2Ym8mhR1fCT5zF7964o3CfxdjET8o2qN2fvmk8/fimWv1qwvWLuNXrPZ8Cgkb25IUPlZLIyurW9GwHj4ELUXKToPyk3MX6sik8ZV0Iu5/RjM/SWIyL3ce9LL0PtzBxufjdroqy+zFixsdEBJh4J/3CsIRiWTt3c79idObge8pRJ0DsMr9YD7b1XNi+QKe28JwZSAviLb6sdI4FVA5arqgkkQUTkiQr5J4knKIi/pxFO8a1QbLMLnRXktn0wlxd+K3xD3nyr4EbwfngTJ10O63whiP8tPyDv0wZMUnzxwPL44c9RDX3R3xPjD4vv4=</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjKUqriqqX4WpoCNRWQtRG82PoaDQX4xY5Jc8JP7ZiVOurizOBsSZ3DByuAyBLuYclJ+LHSxb+6OCjlMtDBA6RGIxKzgf65MNFMmzRqS8xycFg==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fsCGsTPotp54IlOBT++EeD6VXPVss+sQy5WGBAP7r4ZHtidZBpQOE3poonFxbUN/7PJ70K3FuSysSN5iO05HtZUci+cbvnwXDpF2D15Zk+A3g==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjKUqriqqX4WpoCNRWQtRG8239lFmSrg8CyHgJCQqTvuk8CHv4HpDTd5CjMeEG4+PqI=</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfU4rrZ6Op0KZZwytwN0yydGZcG+AQof6f/r17dYWhIiewPsAnXNJx3ALsEnqHlBTF6ji0JTQVS6Zsc3thIWbxREqWKw/TZ9fsgUrlr9+Kuptz4H5VAEWg+xJDRdkOzOtMm8nTN9uq3paJq77W5KK+eBoFZGJjk+vT/LgCiKj8qyAZG0d1uFCoYLARUESziov9U005rO33crouLHsSwTOOSmqaHMB6pDClTNhXYXpCfu2OoT5eZE73MYQFRxYXigtpTQwo+xopbBWW5+3JPqWaBPGJhVkVoHbzC79SPdMGpcDgOjOZvyxxpC78UyPf5NreOJ3LkfWu5vVExwo5caU1MMQ==</Encrypted>]]>

      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7xjdHAMO8z5fAHbFZSmhAYkxBF1gzSLhpw4yyUaJ6hIlRu8HLiFnpcQBDeqGqYW43I0m1V50Cv3kL0JUVztcH7QSkEvUR46+N+oW623IqX+LfvWkLC0EUxM2H+FpMjojbYcyWP4ek1ObdmGLtytwIs28Hjgx9K+F79Q9IqqrMyFZ34oeQvu/jDkmsAaHdKatfoeqyaDnztxTlp4sRcNWR5+ZLtoqeUZjAmeDmJ8Uz7gGzIILdTwd8yZ7semVEgTnM+RtcBMGWp+Xvz6dKkxSYEt+F1D8b7yX01C9VuNlDSvz/Sdarr7palicYqhz5mDB0GRC/KaaJUDiYMBSdo3Gt3z1rFqkvUOrSiQ1sj6NMnoKEU8GMYk0b1PkoRdgRSh39UoyDimTDAFjH4QnUkxDPtorvCQQ+DTC4RhwO5pPJZvrqt1kDnhyAKQKLIFkPrMJZkgVOm7Ul4wvq7BoUgeFbaKwvisPQASJ8dhnC63LNhr0694L60xvmIRv3A7w4J8ynikYc/Wirr/hpU1rApefnckY9+JroxSc86DE3d6O6hZK1FOMefMU255lTT60r9qIoEByErRMR6Q0R9pqLu7jtJ3m7JqX9EChllPeAY9xfNSL+dkJqGtVEHjGQul+rh8emP1fOSPJ4298bz/T3uXoL0CWKBtflDrWxTgLZrS2tCxiAtQ9RX/SdHBcqcuDXbJLMlnY+Su+YK7WQ/BZukayums4z8cN5NCnfOVrmoT6wQk1Oxki8jprb6mJXDDm9fvzkJc2AVV7GLASEP6UD5q9+89IJR2Jy76AfTDFWsUUl1XcnJenhhi4mao0ItDBi2fIHNn7hz5oVoWcLNAshHvGu9yM68gt677YvM5DFeLBm6eN5BLpTCIQigvdjTruZZvYCySFXtey+ep8UqPnlggxqYSDpbLoDMyrRWy4T5IB5UZHgO9oMi25hE+Z1+OqyNNb7w/wsu6WDCS/l++6BoWOGOokGkFJmFM7tQM4Jm4nP+6SeTSofqqGbffcuRxpZ9OVjgo5fRxBO4g7gmgoBuzzySwoDcwPy5aQH3e+WhWVcyfRoyoYV4TajuymO4xN1dvZ8=</Encrypted>]]>&PaymentRequestHidden;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V4JMgLxmlt9dSbVFsjGp/bOPe1Iuj/2cJCrEplWzYi3haj2qEAPSouDLWALygI7fhmRcKan3KUCjal5PqD7GaGZPjZ0cb36OEwnb6YmTNQD6nvj0Ky7LEyyFStEZDeqcGJszwqManbWivTHsmQf2oH9aLHTnyvJ6ZGBtZa6uODYD5145tw5H1G0bf4+hDD8XhHYu0V8zUuFfy7y+amM8wx/mtVqzSincaPLHWxRQjOlIbJmRGq0jnkZJ8iOVZLAu5bZJOR3Y/TeEaP+S51GU+DMto3gCM4UfhD9NfJjykai7lzhhm5JgkL6fnw8bt3pGrrj+UcMmTdnmx5XCphTmLCkaw7nGWgiP0nC6J5jz1FEdVyUhMFUESrX4qAvGRltOte5WnLwyNEU7mT91dJED9RChK603aX13km4fpn8dQOz9sRNie0a5szuwMXBX0x/o83mWEbiwq4aYK4KyTRY5HiMZ4psIUTML0X5xA3nCXvI2qSp0vm3q9x8eUkIoWQbhPeVkZyMX+xnl5tu64xtH5r8RlOE+XjLmVvPy8UM04YiPsOhA+YHIc4WNFeciVdyyNlTHGmR1+4cfzwbEDFZlM3WM4AGyIEN7UMlhnp63GWo3eL2osrqC5zHri1ETyaX0LYODu6q8lTjOklPAbXegYYZQigJCfUlOo/nKS4TDYQVd+dPg+eP2qz146hNURmhjC3s+olMavRgCZAVBwB6kNc6PqHIm3GlodkVJUyQ85K1QGmVQ1M5XJJdd/wr4J2JUBQ+OiSjBvgOVU4kOLwcfZN+s+SP95PM796bQiIUEX3pQQ7t73ve/C4VIncsqRpy1oYYHwJjZP4vIgH4F/476k/7AjfW8uTuIeEieIRLXwNBwxxxIXupyl6QIxDYiHvLiVn/2kKbWrUF0M90nNgcI2WIAI86EPoEpKo8cMA4Goervw7dfDKngolkkv9zBilqdjzh552u0dSfaiIvfEYuLkLrjEjRZ9uzHWLdP3Mxm7wJ+ywNwbXVTTlNaB6lrY2s9kmF6QyqEXfKa8qzEd7U5aqefATFrMpNBFt7E0MlD8n88wfLUPzhSJVBJgiI9601l1yeSLKOcGETG6aSZvQ4SV49HeirQdX2IXEd0NVYORao4tDNk9lUi7XFQfL6ExBh8DZRE+QUjg5Qynk9cVf1u5gDhGrzhXOyjbcWg3Fn5YXFuoKYJKyGriQH7bZeXsapgP92FAZ90ALk457JhWW8L0HOX8CuQ6qZD8rb+XOY5ZpFymY/UpmLXG4AezBcIYR7GwVzasiseNJHOOTuDQu8vpU=</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &APVFunctionScript;
      &PostScript;
      &DeductibleFunction;
      &ScriptVerifyInputVATInvoiceNumber;
      &ScriptVerifyInputVATInvoiceNumberExternal;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwddkebjQuEWIiRC7gMr70mJ+ZhhiIh/S2km6rEYl1T+hoEaqPYobin9vVBX/J7Fy1L4tTVsJ578yH82kX8cYBNEY69AgTiTDsuckVaZXIWQs1lI/mbpCeiXOvBgRdmYGCcTetideIJfvE9bABoEQqdOpnhwlUBDioGwCmxK5+7fEemeP8PXPko2cPMu3MInCe3XUGDz5/M92SvB/ylPvZdpY/1T0+3ryN6u3uAW2AigT7I30UUwXMn0lEFFynq9QsLBNAmvylMT7cp6lpuojMO2A=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>