<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenCashCopying.xml">
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

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY CommandCheckDetailInputVATInvoice "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/S6DWWSfNYsR9PiXR71VxdUKj3flConpM9aWamTuCRYUEudZbnjkNsFeuA0cPXcydxyqrvXiIIx1we+FxcFh5Ch1+HJIa3FHTOVkzE2QX3BFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$UYQ5HKtSK9dNBaTXjfU+gV6rngw4XJ2jl3BRU4Ev119WRoIOuMVa+23ZETC+5llAuNeZhJ6ZTaM8XgFv3BuqDoxvYMm3cc5ocwTgqglggoiBMPgKD5xqeQNUkuX5Ard+UKaDtOsGTMLNrIlzPGL1/8p+t91PjadzWK7CkkWtjqNUGwzjV3di2r3VMpoD8opUvmfdOje6KeGNRShEp56KQ7JQe1QU2zlF99zEJMIefATJ7RnO5WVb2SiVCAIbFfeV+VFws3YHUI2g3tmhxQ5wDeHB+tRSDzVYQPGtcZDjP7h5lnu3YLFCkFxmjReZQuxtH4BGXE+JTxyPA5Qoc14vKV4LRZRZbiQFwOmH8bWTHk+hUuZ+25zpwSUtg1SAM23r40hx7n/gXbFQvKvYeIAQgv3VjaU+WuSA/UNFJFZQC9GAIsg3Z1WfPTN+wlLJZeSzdu4kecFmixUcAwnK/1v14WW/hwTa8cwUXDM25WfYMq+CY8YQRegrg9myLloHER9pxfqpZoWnbv1PjMJ/VEVQDpSyO2Wb8TUDoPSALq3VxG4pLv0C8xFp1y/QPQfvcwox+wGSnqrJ7h9u8UElEGLkMBmEj3qm1+j3l/QfIoVuigPEOBc5ZpZcLATldoQXY19wntupZbWMfPcMiHDMJCYeKTT5tflk1mN3cqd+bTXxdhLDgUVSxEqDZHfVK+KmAdik0F06c/7x597o9y25FqaDXeuSzouuJrvXFN6iMxanO68DPTwhdVe6oL58TW5TKEai4yYrhLHUDjXXUNOM+M/qCOzzj2UAMc9xFHXdWvd40eo/F7eRczXA20gQKqjxRZ3YDttNeLSTjGDWQJQ5Uwz9aQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$r5mxJdPy4L+ypXLwfaCaTlABXjUM4tr7d6VMGDYxV66wQmO4bv0TjV6I09uDu1TVCW6pPEZ1Mu08fCrqK1hA37WZGQQ/Zm4IdyxON4uCkEs=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8hRs3Z4F8HldPRiBYUhzSLh+Au4038GE+H0lncn9RWR6zsvuqc7gG15NuGbyrvU1JLK+/dKyu/rQTNAXBkun+1EUf/TQ2vgteLHuVRcju/xt8SyNyXhYIOWJVfkXNP8RKYK2C/m1Am8hmdJLEgKgafHA4GLUK0xG+SFt99iAXmtmFastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5ddOZ7SXM0GqCPEdBvTQ+3/6IKctJpixU+BV5f2glD5K186+3GkiJV9mjS+ifJVL0ZdETxrcoP4Wyix/dnpGKAw=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFGqIzO+2dk14W5dcqJF4gyI=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$g9eHRt2pDXV3uFXvmOAWwFNLoLiv80bygdBuYhfPRvE=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$5eMzFgYntcX/cIryXjBckfQtpXFVYeBsDl1YrIX/n5g=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$X+vaXJtJ3NF+9gNp+SHCOo37s6uwv98UxKuWJMfJ5Gkwxjk+QW0vLU7rIIdgJOMpXxFjUFubuRRLs3zOx+lsrw==FastBusiness.Encryption.End">

  <!ENTITY CommandCheckCharge "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcFTCkjgsxqXhNAE1WUQc7BXRFqmEUYZjPny9fwK152J/toHNE5MmQ0fneBshfqfhjmJHboD6u/YWuyuDA531Ec2zJ3pjElrJdLBRMo6ZzPRuuXtsiLO/9Ong7tWEi9kANSUQbXUnj1GQP5rRLw2j54QHiKWhuHPXKc9lQeHkKT2pFQx0joWRlBcT0s5LLjcBqOS84YRptzYV9q7oEUynfkjqw6GZhh4uA1Soo6nqxtw7FT3lOrvjL9C9OOwZjEX/yUIjrNMxBppfuYw3taXLcXidrwEi9eblFXvX7LJixt4Kr3eDIJ28RJ76GKXSFjJyRf14mOV500DSygG/wu6+vT4=FastBusiness.Encryption.End&#37;FastBusiness.Encryption.Begin$buUp+dpqA2y+Y5vD1ekU0rbbXcm405fkpzV1ItW0biFNC7Ol/uWTwl5/0BIOiLo77HGPVksF/cwRyI+CgW2FCqURDchn6KysOJkIGUHw1xQ=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$5eMzFgYntcX/cIryXjBckfQtpXFVYeBsDl1YrIX/n5g=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$4Z3iXjUo/EHcYSchZnZy5UBbrgmIwsXiKuTm9HtVFObHlDOrhyLTuLu52b5jhaGhFastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$d5LsedK2xlJ7IajfUw/787EovZHMu/p9QUoSucgV7a993qHZcopKydoxpaJvCcs7jqHGMlpslIYesRVWSediaC/6URJPuKpJITKXLG4VTe8jLEam6vXid2PEkxvCPB0S2DWtHnD+tpN/JuXsBMhJKOjnrX/2EEBhiJOwoA9BNgiX1zT3m5BfdbiMZwgVMVefFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$UYQ5HKtSK9dNBaTXjfU+gV6rngw4XJ2jl3BRU4Ev11/ObyeMVSrMCyQiS8v7yW94cgMLDFyNQnw8dCWxGi7zMV+nRtZzvsiNbNhc2+cm1OL3crQv1VYSjvGXdnM/it9lqQZrWGXku/3R1xVonaDuVNgFrUISnHsR3e/3wi6OLGBurU78GygUM4QRqdWh6xXD+75UhdTjLWqQPPplUVSiPHyxW/mLIoWEoFc5gHNPtlmdemD5dPRjY0VYyT8TFRQ9FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$T5EkQBpcXNCTKupcY0FFkW8biuvQe5USDT34juyXC2K85IHhIsrX4rJQ0469b2MEAJGbetHhuE7BnzbsrNNwhn9Bn1o2BvDZknQzAI1C7m0y4XzO+AOZl8MTjcRxatpFX/uOUwlsFvQsyieD8rRvH/HyDZkeAeFb766CtIRzAg/DmmIqn5KRYemWznu8hH6LFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx9TRubr+WBkhVWJw7xcYW9C2BAwd635fFwp3bPnbl2pFzruKrYA06yYcbpWb0QP+krb4gJiET2qJh6j+0YreIE8oUI4paom8RFXr/Q3mPjbI+LHgSOrEdiDqI6zxEJqCM212vTA91kiFT4vtWSmX5PZiLenyidv+KP29uPQCQ5QF+vaM/6NIlU752pG7avz7hMGcfhubmH0v9PLNKi4WBcwUeI/AyxZ/Q8RmOGDnYo4AIHm0znnkLZ1AYB2/aTJxxo9EL1kWOmKWjjUldeW9JO35z7SSqRlZX20gJK/n/ZgHCKI+0+zYK5gEBdvnXilB9VhGr5iMVLbT7f36d+y824y0lHru5c8wDDajxpMXa95nl58Akkufezb6FlRwNEfRaFnkekHTlDz3qORQdS8smIllpPpfQeAAZw4vaKokbS268Kk6mRfAfNreGZExSrCOMg==FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$5eMzFgYntcX/cIryXjBckfQtpXFVYeBsDl1YrIX/n5g=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$EAVKCaDHkkhaOSZm4xTXUYDc2VPkdmThrN3gYGBF39M=FastBusiness.Encryption.End&#34;FastBusiness.Encryption.Begin$d5LsedK2xlJ7IajfUw/787EovZHMu/p9QUoSucgV7a9YMlCMeyC88enAhDlTGT+oSKsqQYBYAszC8gpGb03aUKlFMixYYqaubyrfXlpWD1I=FastBusiness.Encryption.End">
  <!ENTITY CommandCheckChargeInsert "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu+9feuP/pDhFDfPjha2h/gLHLnVMsCr2gw5x/uC5ShyDiUFgej6wwMjBwPpgCKSNx4pneyK/a/oikujByQFGf4Y/rIpP7sNAjBTW/wHIW0ZzoIiLjmbRRrOo8dmF1v38MHBcp2EcZQQEtZOiEEBCnoza/N52udLOTj/oQjObWmClK8xXcxaeN5iirvlqWcaz3sY85vsQVOmZZhTv9DSnhW/+82Y7SetxFCwLr6uWQ1tNDEwk+X2XjtFAR3/GZ0V4KQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8q4zMmoGC0DezObY0FNAh0/tGXAH4enzs8UfS4KZBom1nV5YIxeD1Bv9uYx3TzRBPvvcpOb1/kTxgGNBjyEFZ/icIjhmERAmVK1ffWbsuemanYKoCTmM22k6VIYwu2Gskg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8umCho7a7aLnOouXfqsSAq4nr2TsyOcYj4zVASGNHYpNFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2jMC/OJrLhzr77cnyZ9Sp29kiVhFZWQCFCHRL1yJ2SNwcaAaGHZnT0JW8lPEnr4LTJudAGQ1i3ovLwpSFbYv/J/w3+Ii6jviOebfoV9EHYgMFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2mTFnDB/YifbniVWTous5upbibDbVX9GYADZ2zjAnjhnxDwGRb+P5BalWbwezxSIG6k8/cn5Nzh6HsyiCyJ/0/5IeXnm469qZXz0njqnGQXDKSa4cBM0f5A/FwqguC8kqtjZdZvB+Xs4he5yEnPq4jwK/1q0julX4f78cqG+2UmUFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx8B33GMdHAzI/4OhohZUGaUGTdorGiedZSnTOEsxlxg99uo/rj4RHiiJFyczR6BTWd74tLEV3CJNyYg8t/olPKYDTp4WiynqXNSBkkhUfJ6SC3P/c3/+yW2+B5JqRUpK3A==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$pTQXBBQSNW1LQu9L+DaKFDWODT3apuSjVrw3GzFo5X6CPCzFGAwPE13w1qvZ7jolFastBusiness.Encryption.End&CommandCheckCharge;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">
  <!ENTITY CommandCheckChargeUpdate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu+9feuP/pDhFDfPjha2h/gLHLnVMsCr2gw5x/uC5ShyDiUFgej6wwMjBwPpgCKSNx4pneyK/a/oikujByQFGf4ZHngvQhVhAjMeFI/abjSsjLGE89XT8J2KmGRAYk1LQPpFsE8HKu4Z1AnAcbMfVjAI6ClmBfNyP4Eg+JoLDMnonIHaDlPcJfQZ3m3/gFJwZaC2c82pDpTXVbluyaiFLgLgs8g/Jqxlx653zhUrEa7lFFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$UYQ5HKtSK9dNBaTXjfU+gQHqzo2mF9iLE3yV60f3CUut56XOH1O2DJQ43pHxjwZqdVgArG/mGei2ZSQmiLP1esItkpUSU7cqyT9PkJl1KtHGzZrO/On79ZME41txaPQnin0h5NN6tzIQY4ovYHU4EApONZzwDdrRiB1BI1+bMzCU5xPd2xNYmckP8G07vjxv1jvMQWnYRrs59KlzsIc1lh7NCkVBl0o3c55y1L3KemXMVhBgamBapKK5m93TCLZJXbl0uEgBpfKpV3FeS7uZbZP+U6I+c0MnfCJ+SZpHoitw3KxFcBDHihLrFNGX/qKcOswgYX8HEwudCDX4bz6pjw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8q4zMmoGC0DezObY0FNAh0+u3N3YEqDPg4Hn75aiyK9t7UKMhwoDKVyyvqupJFQXaVwLTiGii4HLupnIs+9ystI=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$T5EkQBpcXNCTKupcY0FFkWbgyVKBd7Lr4OMXkjbTUdlkGR6gCXxbkEGFOD6POOMkmeMqOmLG7G4FQU7PO3Xhh03KYwhtgnL0ljwMPdmmATN34n7GKC99sbTu76cqtZC0k5z3MEl5jI7ENhEEgwK5dt8tVBtgo3pQE1pqszfxXDs=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8umCho7a7aLnOouXfqsSAq4nr2TsyOcYj4zVASGNHYpNFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2jMC/OJrLhzr77cnyZ9Sp29kiVhFZWQCFCHRL1yJ2SNwcaAaGHZnT0JW8lPEnr4LTJudAGQ1i3ovLwpSFbYv/J/w3+Ii6jviOebfoV9EHYgMFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2mTFnDB/YifbniVWTous5uqc9MO3IM2mVqGklolXDUJH5BXH93M4xGF3htGTCv41bEaOtlwalPHhbIXljQUYv/wn+eHQVljSlydI298lX+Wl6JbGkjZONugF7X5JrtkDBjC05LsioQeiNUQx9sNIXwsjBdYx0qEPildYVZbi7b+BFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8umCho7a7aLnOouXfqsSAq4nr2TsyOcYj4zVASGNHYpNFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2jMC/OJrLhzr77cnyZ9Sp29kiVhFZWQCFCHRL1yJ2SNwINlPYEYXn1sqOPeKNHPeAA9c8ihUgliNH4qJpeuueNDxmhGO7xLI9AWf3yTWJWuFRKfN04+2BlRYNbFtkdqm4/BDx90Cam9kYRQg7/wjQvM=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ZQ48w5RQriGrDGcgASRa2mTFnDB/YifbniVWTous5uqc9MO3IM2mVqGklolXDUJHlABwjwRLtM6qRn3BFbwlOT5qdCHTccvm6Y2W4OQ9n5aN7pQdYpa3kWE4Ifb2mKJEFJarCEqFmi1BorRvmHNIZLROnT2WMQXggYLeTOomVwkNOL1m7hl0ajGpmnlnuRB7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx+P9dOlB5kmYcqaEkooKeAfX2LBg0lOdEoBfDjoEc3NaFiYxbd2PztR/qMslkr6+h2D2+1O9re0GPoKJY8XmXJP8mHDyYTZvjUNW9nt7LMCgLZNOh6oBmzPGgP5IavsghdltRuDtS5X7gAPPnDVMPM4=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$pTQXBBQSNW1LQu9L+DaKFCHvd5R7SAdf0trNYu2jlR/PR9819zx3uK+dxCXo1HJ4FastBusiness.Encryption.End&CommandCheckCharge;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WtYW9IrqZqI3ju9IZVQJSk=FastBusiness.Encryption.End">
  

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

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$BeforeUpdate$PaymentRequest @@prime$partition$previous, 'd46$$partition$previous', @stt_rec, @@action, '57', @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$AfterUpdate$PaymentRequest @@prime$partition$current, 'd46$$partition$current', @stt_rec, @@action, '57', @@userID">

  <!ENTITY PaymentRequestCheckingTitle.v "Thông tin mã khách của giấy báo có phải giống với đề nghị thu tiền.">
  <!ENTITY PaymentRequestCheckingTitle.e "Bank credit advice should have same customer information as customer payment request.">

  <!ENTITY % PaymentRequest SYSTEM "..\Include\PaymentRequest.ent">
  %PaymentRequest;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCA7umS+gLlPK+4C2TLVvG+N48YMLlT8LhKRm3VChl5xY1J7oNYZIW1G9Nq05RCN9pPgJI+zVh7jAwB8cAyBe2/Q==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7UaEs8H7Gb0PN++mJKIn9frwuuPad9X4jB2/rw5eYEUif1QdjVnwovpk9UQxUt4y17kC5wYNaLt47CyFi0MbsJc0hB/m4F3P8xt2Qb1yDZuRDwqwRm+SVWyAk469zpEW8MS8qawGd3ZO9PIjGqRP2v00eA7wLbBGFf67AVhc1/UFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$knoOckCk6knYGNO/UXETAzxNorSsf/WfjJv4XJH4EpxBBTnFn/IJHC4xp3Nyyc022E6QQgBXKUEPcuZCnuhlKEiwXyGMZFExfNo1gmUQRTTMlESQQrXdMgjGFo9N8rqyMcuf5uC2N5s+rMuWnONdv29gltFwmly3T9HTdfRlb3o=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKwBCiNyQJ2rerMVheAhw7/iMhi2IJ3w1E65nOPKE0wJUvPM/GjQUMi9sEUawVkikH/FNjPxSllV7ZJ0WB6MH8fOSd6NWLVVwNI15Sy13GyFzZNMFEjb5k33KU9E4vNsbGv4s7BDx5VsiIZN4Xc4QT9s37Cw1LR2+oD2fLZjKO+1D1E4NCRBCQUWaV7AmnuEK/PuY7YNM9nujIIaHZHarkuKSwoD3LxAgTH68JwrTOORYk2Mge7LIlzBRVitzDAtpFD/IhNooHf8iiohs/3874wx1CO98kcLEb/2nu1285ObpquidnY+D5zJDxG1B0oSuZc=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiQmYxdU984tVY0Tvvg7ovAdEmljeSKAop4q9h/E9gZtfdj30HxDsftgzGrwiCbJUNrRcH2itKeasYfh4uOlk1tf1C+EhLIcMS2rDqcbhDRddLFN0Hnrtjztx8u/jMRev1P5c5XXl/Bmx3G8bbGfHv3MwmHjTfjWfvn/I5DY2X4Vyk7lst6Aa/qUmTwgiRC2Klph+Zl6/rGrCgqkUezshXbA/worT6P/JLtxhCLLvbjibQH3iLVJZwi9Y1dGo8X1ysdzzRRTCzu/3R/g+vGusT3X/oqD66+J4Y9GRmp+BGnQX+MwTfmVYgMGnCeht3eMxjkKETp9fDCiHMPUmch2yz3P5NgJafJRA28mORDWvHqOW0BFK+hUU41O6ofzLE/zSHFM/Why4hKjqMVvhvDXcYy/SwBRnJpmAxbWLI+NTbXaIyhd8BQweiWtUwwNIEjz547sPbiElkkDAmqh67F42sRuTWv07mMgl67/T8/GGJt8ouPanmQd50nOyawpuj84U+bsRupAJUq10b7XpXzRJh42J/00oULh3X8b6TFfu/MlBCAy7IFxhiaHoFxY0OsuZt1cftZbWT76rnqs5G677vlj3iCuVIbe5959MJgVpML/SFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaWgxAp37M9upe1246Yl+c2ejhntT6Q5X4xYiAYpmNg6BRtjowzZ3Dk8bSX8Ty89p44KEmFZleEhcAHzDUnBavH1449L1lEiMmoo+alF36fcbP98B538PKlNWLOmAMlocCc=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUY3BKm/bg//sHFrYwr3M9Um+HxSjq6lFlJobbNkzzQSOzSkKGycUTXqqc8FLCTIt3qXtymX/gKNArjiOIJIwkd0=FastBusiness.Encryption.End">

  <!ENTITY CalculateBookExchangeRate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5teddOpp4IPAroYCkT/JKhj0QXBsyUYQ70ObM6+LeIptpVk957tE1Q0SVln1g1GVWMOAN15T8Bbgr3B880hNxyfYIqyca4BFx/WyeO2PDZCrX4XANke46dzeHuDFdNwYHSugFKOFUfO0974h+Ke79ak+rJ+4rL0LAAjqhx8wK8qFs8aQ8PFv1D9iehAwMT7vcGFZLevp+nNKh4q8HHV5RXgZ0sOWR3a8rdAFOTPjUGnfq8CeUJdJODyATcziXvrQ8q/LM3uZ1yn/hU13W8rEXm4Jbtd/7srbuqbGLyOlvWVKQQYcxLy8QEYGuo/TJCDjuh0Qi9BV3TJmewOHZN/NJ70OrtwSD6Rtia1HTfVrU49A+1ej373ss5Hl1mCmJCafWXGotRbbToYW52XDewuUnBjYtmSx9bvG2LplQ6v+sS/UEs+suB7flP41yBCguKP9U3OcpJIjQteTN10Zu2oydM=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx5hjOaO4cpNFHBJ0jdvV4NN4aSP3K/+UlV+mvnzJok2gcX3Sfzw/V965ytgcZS5ZG1vHjXkUX0ArNbaEXAwMFrNZmGU29wnT9BaPoeZ3kN+BrsHcRYPl9AthJ5L/60WYVEU+OypRvsHX2m43I5dY4YxdO5WNQ0dJqKizqhP9iP7388l/6SuifhEtzUXKhfRvRg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkPFeT1QEOZn4NDTM7BYdS3f4kX6k9SqfLnUBpZTC3XvrBoms/r2UO3XbgvnlmUV6J23YOfpdIy5cnSijvEAWCO4O2zgmIoMh2jnVLoU3OWr2yRGrNxWPFoAJvBABO8ipixUZj0W9UaDN+0yHfNLSTe4TNQFMiVSYTYSFmGLBe7khiAHhL4GbQmWZaUIunvngHYEYEmQ28RFPB1ixF3J/oXyudn6Efjv6YUQplKIINLMViL/ywArmmA/12Xys44TY3lE9I4p0014MFZLDLTlvzNWikWeR7YQrQd65CemTR1whhkuLLlP5IvXtZF2eaQp4TI6o/2LvYR8F+4xMwX7YLR4bk4y38EDsn4Yvyjnr2DzV+m02nD9ERrHpJUmLmAtC1oLyHXYympRbgQtsXOibXzg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13o4O3aQe+UWuJOzV+bTkr/MCY7rcT/Qm7hHZJOURJx46O346CkaCFj++2X6q5z3UQb+x+DvS3rqJTz6UhCYA8U7IQDeZxNM5fFCjuKXTXeRKvBQDRzVdhivCS3xB3bHjje32a8u7uv3J2ydp3ize7ezfWylafCQb3KLOe57ko5cVFN6ZqYwY2il04t6dY/vy4o4WVvsmihOO0TuPwmSWfGFJ1cSwJwYmuYWfWRCVYpOYtNMYTVv/rOTJ8Ft2foLfz+1dhYYIi8gppxRJf3Ggrr76PnTupAfOQY3oBg1LC+r/ZPv3YTxTUaOOOZzhLrbQn+B2JB37l6JQxPt7gz8MhsOZSi7poSXIuj2kwP9E7eX9YL4ZL0BDarwJwBfR2ME9HWcofacjrXE919LGRGWKDKesuE90ittqEgIaDFQwZqVMAKDq/dAoTyw5XK9gxX2LzHnPJUAx8ZyNA9Yk79W8GM9V96WR+snioU1nLWJpkcq2KLsJIH84W/RqrE3TXy71Aw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkFXt1zDEjg+qKWzO+Tgd2BDRaKTP9k3oWVmMpKuTfd1mJDfwJgYPtqjFmH99f5Epamp5NCCydboJLErFZ+vK6Qe58L/M1gxidfpBkbLQVRGrdBGSM+TdQ1AejqycRtiCOBK0+7/uz+UioREBCJm7l7Wc9p1OrJ3CqZbuK8L8jwYyIKbLbhN9Mmq5dnFksCs62T7OqTpHkCwbsN0MTndy01hfNPp97COtaC6g/iX8SsJwC0dABAChZLB9fu5gfv7JhEG5KEdm+6kD2v/mX2BzbGhQnF12pF8JPtSdueCExvZ+YsOZmttc73KtaxgPkGONswPKnRoPToUCmRzW8RibfvH65kZ2/D43spExycsfLFfk5Dj5q6em447PImtpRIJmklsli7Bn9VpBbWOpqdbNyjtVrSiySKyu9JLlOKXzjmUCbmH/Ls3N8/bIxZ55phD63FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13o4O3aQe+UWuJOzV+bTkr/Pc8TYbcTUFk/QqRPkSCzmFbdFJVFM/KK4FrRfYKEm/RJB6iQvuUF/EYtHR2XBko0xVhi4/Q9knnJZQ3LjSc9M4s6o28GL4GIA3wnDMxrbai+qYiZK4fSyO7Ai0IWp+lv7GOlbp4ArceaA0CEqDoS9gAcNtTtEU/7tm3kEygUryQ12ArNNAKnlYe2ZNRkEvFDRM15biFRyFGoGSLvH0k9TBGLNvcEVbyrZbsB757zRWU5ENPyJUHlCONg/cdxFbi6JYCsaPDmN7e21qAnhxKNid4nfk9X5XmmoHNWE2L+VEjaHJZGnnYphlrsgTYr5Nrs6qafeqGZsw6HoX+kEvgsRXj+330q8uNDigh104eQDfWy3UjGJ1kTP2V4qxTfukuAIHQGLOepX97K7VKiBFaCDv4kcM6MmPnc6wZ5hKCrHGww==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CBTran;
  %Extender.Ignore;
]>

<dir table="m46$000000" code="stt_rec" order="ngay_ct, so_ct" id="BC1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giấy báo có" e="Bank Credit Advice"></title>
  <partition table="c46$000000" prime="m46$" inquiry="i46$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
    <field name="dia_chi" defaultValue="''" >
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ong_ba">
      <header v="Người nộp tiền" e="Payer"></header>
    </field>
    <field name="dien_giai">
      <header v="Lý do nộp" e="Pay for"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>
    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2" >
      <header v="Loại phiếu thu" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai_ct%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_ct%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu thu" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" categoryIndex="3">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left"  categoryIndex="3" filterSource="Optional">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_tt" categoryIndex="3" filterSource="Optional">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="hd_yn" type="Boolean" categoryIndex="-1">
      <header v="Theo dõi thanh toán" e="Payment Control"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJYsw8MgVJF8llh8nasSg9irUUqUUJilQAvJcTSxGsqm4fEFF0rHh1sl206GVPwGozt3N+0zZfCxUh8uUGFa0nGI=</Encrypted>]]></clientScript>
    </field>
    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
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
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Nz5IiREyof/by9sgXFFbzSNN5lUA3OZst9S81T7AdqnsBMef6wiJk1nxo88LSjFEA==</Encrypted>]]></clientScript>
    </field>

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d46" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CBDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="f46" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="5">
      <header v="" e=""></header>
      <label v="Phí ngân hàng" e="Bank Charges"></label >
      <items style="Grid" controller="CBCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct_goc" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" categoryIndex="9">
      <header v="Chứng từ gốc" e="Document(s)"></header>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cn_ex" type="Decimal" readOnly="true" external="true" defaultValue="0" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="serialize" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="analyze" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="254" anchor="6" split="10">
      <item value="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="111000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110000000-10011: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="11--------10011: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [tk_ex]"/>

      <item value="110000000-11011: [dien_giai].Label, [dien_giai], [ty_gia].Label, [ma_nt], [ty_gia], [ten_tk_ex]"/>
      <item value="111000000-1100-: [loai_ct].Label, [loai_ct], [ten_loai_ct%l], [status].Label, [status]"/>
      <item value="111000000-0000-: [tk].Label, [tk], [ten_tk%l]"/>

      <item value="1: [d46]" />

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>

      <item value="111000000000000: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11------------1: [so_ct0].Label, [so_ct0], [analyze]"/>
      <item value="11--------11111: [ngay_ct0].Label, [ngay_ct0], [ma_tt0], [ten_tt0], [cookie], [ma_dvcs], [serialize]"/>

      <item value="1: [f46]" />

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="100, 100,9, 120, 100, 0, 0, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6" split="10">
          <header v="Thanh toán" e="Payment"/>
        </category>
        <category index="5" columns="769" anchor="1" split="1">
          <header v="Phí ngân hàng" e="Bank Charges"/>
        </category>

        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IL62DQvW4Sx5tOA6CAsKEIQ71/dJ1So7p33gANfWQ1VW4l9qHeMEiwzS7QtIdwI64bjzCE7wjwEVp3SHHWEjdEf</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgi+ov6YV6nwDT9MIu2eLGlVMoZdpHU1/ClFeUiYsbBmQ/W2xAgx3X/VpT2fXOoMRH6R/w8LDxLMyNX3NbY3yDWQ5hyXXfgY98vgHb7Vg0ruxeqe7rNlZ5FAHZ9w5BzYCuJglsxUTtS9OExrDra6FLLM2KnRt3l5F80jXlGrXBxV0w==</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0z4sFwF7cdKnIcbhLvJe3kpBMrwoKl7v0r37zxXuk921dT12aszdw03eoOmZRSsqrG6W+BDjTb9p+NDiJdXvFEI=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbHYzniaW4dq2tDjay0JKhF5iPztkCZ5x9vTzTHo+mRgIOeagoZrMFzFBZaFMS56pv3sn6EkYzoJ9hJR3RbJzJGhi08Z4FysrJ4YFUAMFGP6iLJ0h6uwXiCJguxEQnOHglonyqUHpvRGdJXs+nzW+eImdW7AddcbcznbjX8Vbl8ObhDr5aExo2H85sIsFAbXdSB9IpUS8vz/hg6X7it+8+ibJhw0Afy1NVPMMNDN+XP4jkZ6iQfEULSNNgf1ug/GRlKnmA4fkVts5OyzzX5LD+uqm3IwRyavN7PCUYliU87nfutVi8l8DBYascerBuiz92pcKTARDpEdtuJFOrQ5X42sgBj6M9tMH9/lZlg2dnqN1g5KnzKHPAaE9D7pZjbVa6vY0HI7uCPHQkk+q0lz1jf5s3CHATT0F6c2+H+cdKxCOyIoon22r6nlF8teQPrIk06w0SGTnJx33nW9Q72kwTkXF3ZQO0WgDnwgcrzaRjv29RVtuGGsPWGtalw13y5//aaQKxHcmbSZE9s8FEu78Ox6g7FEL3snI19r71bJFfV3/qL11T/Q+8e02xINhPRlPLLa21/JM8iHxNE2xsx+k9TDmUqhdFs8ZqeY/g3/ePCtISVQyWRlstzCbdeyDRfCNb6JdsOePfxJochMgewMWaaxgfXYiCha1osX+9Ssub6ISQgsj+DiSq85pP1FWifHCcTUjZvffwXjZZGfLgZ/mobqWZL41GXN4PfhW7WSRsU8wil6aHHtFZ6+AFzINSNf6EpKJ4OJ1JZsrQjTTpAKQRASIrBr6wgUjpaKJqxYAL7r4=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckDetailInputVATInvoice;
        &CommandCheckChargeInsert;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+JxquRfWxTOi/rXBOmgaqKkUTUlkB812jgmIfx+dPfMyFxMofAKjxb4njbz5ciKP8zFyqIpXZzUcJWh2Fv4+clQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNf7/Zekthfb+zqoZuDQFAb/VGAgYzUdoqvlZX83fGq6th0M1dtx9AXrGRRDXFEdYx31N6x5TCkQ1ie5CKOe+g3zIuPLu5vuCCIi8150hYCO</Encrypted>]]>
        &AfterUpdate;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &ListDeclare;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX1jx08uZVuaqldj6SW7K3SJMvpN8bZpxx4uP/JV8cdiJJLBmU/uv3XrlY5vsSB396VkjOLPaUgbevd+T3F3rBj5uGbqWxxVbRomgJ1Bd/wP8</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06uOG1Vd76hdAbygCRPp63TAxbiULKSpoaNN8FbeBBXwVhKPnWYEkZBY8zN44nVWOvoGay9/bXMnffGQK6n/mTGqA7J7hCr8HbauMcRnqS1dQBnwD2g5zFyu/FqfS8BEIg0X4hcxDu++QbyNJbRlVbo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckDetailInputVATInvoice;
        &CommandCheckChargeUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ+oOmboeVNm2IPlr7fHAXO6Q6S5cGWkd5xlwEo3E3guyJj8TQFE2pKTsjBN3Fib8zZnsAovzwTDquVtkbV2D425lnWDb1zaf45PlSv3Oe+MrA==</Encrypted>]]>&VoucherWhenBeforeUpdateLog;&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku/6UgBLnYSt7JUKIgLMLoUIHz2rNXzGGF/bDzF+buT9IPDtch89UoJKammIxBqPCsaqiXu/5vbfPk/9vLMbTwTpz2x4RBxXxrHc1avEiscMkL+ksrH4h2Aa3BysYxYs5N3viZBoxtGBegjPmNCjoR0SYWyRHNTYKT/eb93O/QetrQeFDVQpPKMkOFO0wJ3mmLtgNhLdKZ8M1kQLVCT3W54nHREFyhyQCR3ZjB9eDdpkEI9TtLAn7AZsPCeBulVT6fZWctbV6na1DDL3ahyGjtsg=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YBc7Qi9M5yh+vB1ku9fkP4WnTFBmMkl5lZtJodzGBSkks1IfGdUOzb3CtrT9P/o7gRspM9B36vMQX26wRYByJZfO1tDaDDzpFxmVblNviOtnZ0gieqQ8SP1ZLaoyEGLeHNfkdi1fCTrKosn7g5ecf2RmSAmIQHN/BCjP8vVgUTKh5cpV2EuUWcLNjmMzddazzSY4k5blQzNo4ix+rkxhA7HdeHGA2Bjv017pnBxqNh5Sjr2rF2R36FUz3pmkQRJ+w==</Encrypted>]]>
        &AfterUpdate;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCEI6oJLQbWkY2jR385jsDpMjh0Ybm3Tb2L4S+8pxVT9q8cV9wnML6rp5swXYRzt9afwgyEtOxOCh7AsgsVWvrbvFEegHO942vfjRaKbdgn1</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06uOG1Vd76hdAbygCRPp63RtLLsCjfNfRgng8XRgxgm7EygZ/wCI7iFFBoCvtWM/QviUpGt00bIvy8NS5eQyLRsD4VkFzM0x8v9Wtw/vSdcg</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5s0y2UOo+ZT5K16pLLsdqCXtGqNx9BZEMwxMpAXEByzdjrfmy4/wdQHsNPErddYZ+oOmboeVNm2IPlr7fHAXO6B4VBHFvXqJoO3PgiEkfvZUvGf57SzwPHeo2mCCedM8FRktkYCbGa+cmh9SOkeNdnHiy+C4uWRo+h6oenK5Th8Q==</Encrypted>]]>&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLOwnhINpfvGkcvmE1FEvm30a/h686COTHbFxVvp/QeWpYf51ov8yAOG94IFgV+d9q8L2hbhOUcsKXcybhaUHCNg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1UCjtnDq2jUULDom8RtX29jnaeoG2g+qJ5UEgAgslmNCoxsrbdNtALXwOM1Mg+YI1h2vXq/LCNx7uGqa4A4uU=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1Bo2N/ShRSOMhvwIZzgv4YW1eJccHDEmIPZzgdVg7Uvjkd43LbYT/H+mEkSLi4L5QLmhnzgDgVFllyhgDcFgMo=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxcL2ICQ5VtmpNrpmyf+nmJlBTRnmQFY4b8L4tcuw/pxnGPLA0m/n5eBKJx6Bmhg/w==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
        &VoucherLogUpdateStatus;
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkBRLdNNC0GhOEqZ4RRxGPhPlD3ukB7ogsMgMErPlcyfIWHs4fMYn755mgH6i/+n8Od3qgklnyx1qt3mi4ZrfvZx2E1PuDA9+7zK0dut6K3ebV5yc7NdZfof6NxrFzSXEm6A72j59IksT58sKW6jOBfwAbKHPq6/SjKzJ9wp7u81MxtVjua7fNn4krCbjHX5wf3RwtSsVQhYGyL9QfGQIU8jzZCDWROO8x25OufNtPD9eIpmNSlBPr/97xX5cQvAnIvionWDoEN5+CbffuOU6V6qc7Hkh2ufZiVQQMAKa7SSlsn9CGS1ATwJFJ6PKPMHnRrI3zSF4Jb3hHu+yCjr/0uguckAOc05OsQjbTGiYJ1DPZg3XgUrCGXggAt4I68Jp/fGxJfPSPQ6YUN8OAzFWw+rQx/4GX64/Uzu7PwOTHktWs/OnrnKjkIrfOPJLNhV6epA+w+fH/4eMarhAcZOWedfkS5fAfabm6syNptF3UzTb3+bjmljkHE1SSnJgykr1uNxcgje3SOGHb1uTZ8nEkL/+w7saGcj7WVZpBlRTQhOxOjo+qzUOigS/PZEf8po95aBQxv/4MrvwTsrFf9WwzbTAlw10/8S5oh0GnVN1TazXMtrl19xLOpkiyvkMjEjMDI=</Encrypted>]]>
        &PaymentRequestChecking;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpkYx3sBKeFvn5xF7ZfQgDKIcLM2heSpZT/z4Yu3FikqpiwV/kVvGT8jNidhhdtcwNnSPIfpTzAio0/RN9m47VxQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d62s9SvA6Mj2Gtaax3UesQGSqFpg+S3Y+kz4c5nAFoIoI92dxwlUrpP0wIaVTEiMicMaQyOZRF4SFDTTijZPLoJzK0s1sOKNKp1OynFT8HZrTeVwrD11jbJyRHQ8et4Vv5v57ZYF9W2qdYBW7Gr8TFhFPEvXZBAi3UwZI3KX33CL+TFKw0dWHm/6wXwO5MXeg==</Encrypted>]]>
      &PaymentRequestCustomerIdentity;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22W4pzUVG64ov4Nn6w3vifd6pWmrGptYjZdTH2YNFzIQrGymXLMhqWPDL7oNjEdGSIg==</Encrypted>]]>&ScriptScatterVoucher;&PaymentRequestCustomerIdentity;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtqPDbEl8F9tJsXzXyd1EtXpGUdJrtyTz1lMArzfwyyUIRnAt74nAxCGMQ7+J4qN98mypFC/4er54ky27M1igg3Yx++tD7H/zhwE6xLZZynvg=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q97JImtt+Xw1HQpbeFFL8ZguyfClehHL70gb5kekB04TVVesmFsTLx+kGcWLDsw3gpMP2tzGJgRgzRPDz3/4se7zf6uegi22X8ZFiegcmpVjTaVnyQAJv7yltf8Wfn31DGJw8+Y5A/YGocSNRD0QCCUzrGN9YcL8hfBd7kBI7HX9+8ceJXg4zFIXv3TdoZLMqacTax7CTVS5JXzpIb0i4Y=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RXiMwfzBe5KdsEX3N8ILCJPOTZZktorxqif7gv5nD/tr0+egoTyarxLa6qElRGJ1QO6WT/68IDfIEnERJzhkxqriCWiBp2eEulVuYZC7kyEkOwNCdVQaNG0veTQQZVyHWsjHakSLFchS7PU6WNFqcN1Jv4Pd/VLoXvVCevg8PcJnStEEXRfLFIfV2mvwWkc1Ct+rfljdEPGjHtmBzjTrQ+j</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6r5xlLf+5vfoqctqtt+WeSNb1kkYk4xBoxhmiqfDFNB7N1qNl7KMyMo5x4SIPRNgZ5tvAYLGxiJwmiIeoNIF6FnDD4oIRDUEU5ykoSiXZH4EA==</Encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lrqPze9HEJqK0IxHOAB2Whc7JZPy1m53zbM+wL9JBHojtKPJU+Tuf/TA4xAN76bJE9HQ3T/yIpVvbBP2Pyxxis+zQjd+8nPMN3Q8cK7gwNSV9nT9rixFoOAEcF9OuWm6eXD47Gh/Pd+iwcZ1bP56SEKZD4KL/Z345xbGFvx8PLSoSxNmVoVnjErrMygua6PUVxQNG4iKXTeYTlO6p4t8h1FImFOqoJnIMFz3nk017e7H6oi98yxdC8+7SXBzrlrluRyCm257bWsViNjE5xPRMNEMp3vfL2sKwm+ThirUFojuwA2dewWBKQZRkS1l8M/Csw9Cuq/gASF4Uthv+u99qWk040CusL/jBuTQSlSAAeJnwsqg8NvTgBDTAhCttiG6wbUA92wjRmJoA4fAa66YqrLgPz8oLRf9FnzK9Ip1xAxgATV5Jpu0dv2XIXu7dcHfizaYpkdFp59ughlZQOKvSlP5ypkq/ZaJjxYfKNzH4yl1Y2h7sim5nddESKvMulSKykzXY0vzf+HXTXIDFOEZybykfDa29oRPa7zlejQxgjEIuyZVp5zq3R91p8htIE0dOTbKoQPT4pIhr6KwA1njUuDOq7D0yx226oHgHmAS7xd9mxIoJys/RnWfBStNQC+wt/xERGrNwQY9H00L112iIi/ryDFmrjVhUtC9VIg8H5r6q7HOcDxw2Ad1Kk3cLf2oUSgrR4U1Brp2EFNoni7IxOb2zvAogSOUMpNEIX0NuP86BRCVcjj9VKEilTKRqY50T/an9Vy5OUFm9sifV8yhAaH1Ng4LABqEFjiiAkr/pm/A2GWMC9bMBAar4J2wCzo5s5YTYKxkh3plaW4Vv0cJWMw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKFS1UpgjIp4vpnbJajhXYCwV4Ns/zEX1bDC7BfFiCSlLzUEe27qEDjiEwx9ipm5TqY=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRH6Po6U6TsfR2Fb8g+wtASsjYLgxDEsf2EmCQua2PHBr3l9Nrs4YPBJ1rCkTc33FbU/FnlJ7mBZOBoN7WLmFD/XxRCi2qdJAthmL8XW8W8H0GmR9mzxLB0vOfGHM01yphAkcRh3xLxKaoJoqke+0kzwY0bffTV2od80x/7KTzPkl9yFu1U352EeiaUd8k8W2ZmP8LNpf2M2Gm3ZJwArZn6WNbtOIIaoiTH6lEoiTUC2ctQ8ZAt8sXxFK8sVuwMjfifOzhzLSapyh8y4ymfh/fCdo88twjwkQlYiZfQDMF0rD1yUAK5xrmFxUrXV49z9/5HZECgPejUgJjPykNP8ZAJNg0eaTY+0OGy1tNHbVSq8bvBoDFvE0JowmiE6Cgn9UKR5GjRXu+XfJ+xme1vdWy6eHLJzZ7niU5S9PVjhvFVII9Q/VvmXKyUl390NcJ5Ssy+FnyTZWop0JE85baEgkvXHaYqrmADoorttROo47utDySDrWpoMqh5BvpMc+I9aGsUVAkZi6Ekx2OY0t8Ko1+FRKcaiLhu1L6hKy1yQtkOsB85NUae6l2Y333XfA3ITDE+4rzdn+g2oZph2+cRkvoTs=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjI+l2vImLMAch5p7c8GE+7RsUfIwzxQu1SfM6s/Al0fK0/ZOsnUT7QCbJphR6q/Yr6G7fLDJIknjtc9djQDyszFU4ORZfU5CjCJj0B4Z2F2/Q==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fsCGsTPotp54IlOBT++EeD6VXPVss+sQy5WGBAP7r4ZHtidZBpQOE3poonFxbUN/7PJ70K3FuSysSN5iO05HtZUci+cbvnwXDpF2D15Zk+A3g==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &ListResponseTicket;
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4chmLD8DB5E/lJdQU1npQ20xwMvWJM7y2/1gcenZGRjR1r+ukZ/JSpwYmimUP1UqSnrSxk6Wc6ptcGr2nQzZDgFcIAX4q3Mu1ecvpN7BjCPAfbkX8eNjmbmXCNQGBcWa2V8p30GEcOinYw+Uu+IYtxP0E05weelI8W+Rdn8b8FOHx2QY+7pvsLDodTUbiuB8ez/UZylkXdJhsfht01tkL0UCMp24VWnX/5QY0Mt5p+XJ3FQwtJWjGE3o0p709uIZdA==</Encrypted>]]>
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfU4rrZ6Op0KZZwytwN0yydGZcG+AQof6f/r17dYWhIiewPsAnXNJx3ALsEnqHlBTF6ji0JTQVS6Zsc3thIWbxREozeVnBFHh7kPmDJNpJoAjUQxZNif+qMLXYZFChvoqYSwGA6F9yP3ycm8oWldfywFvP9y2x3cwuLLadwOvPCN5+uHQAiz5VuQDvoSqXGBTWD5FcWZn33IsnW1ZoPIu41W0Ns1LmMv/8Ll7O3zs3M5SIKKqb2AbbxIdsqVbWIByx0</Encrypted>]]>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7xjdHAMO8z5fAHbFZSmhAYkxBF1gzSLhpw4yyUaJ6hIlRu8HLiFnpcQBDeqGqYW43I0m1V50Cv3kL0JUVztcH7QSkEvUR46+N+oW623IqX+LfvWkLC0EUxM2H+FpMjojbYcyWP4ek1ObdmGLtytwIs28Hjgx9K+F79Q9IqqrMyFZ34oeQvu/jDkmsAaHdKatfoeqyaDnztxTlp4sRcNWR5+ZLtoqeUZjAmeDmJ8Uz7gGzIILdTwd8yZ7semVEgTnM+RtcBMGWp+Xvz6dKkxSYEt+F1D8b7yX01C9VuNlDSvz/Sdarr7palicYqhz5mDB0GRC/KaaJUDiYMBSdo3Gt3z1rFqkvUOrSiQ1sj6NMnoKEU8GMYk0b1PkoRdgRSh39UoyDimTDAFjH4QnUkxDPt/+ZR65WMxUZ38LI32NviRWilyOGQpI4e8IgE9XKZ5UkF+spqnjJNhlj3BANj99Ex2h60B9YNA6Kp45ZenBUO5AefGcW4CXb2jZE2NAFmnza+rmqOXQPMxbqOIWkMnYhJAz0eMpRIUJRWHthg1jJWx/D0uxFm1jPhv48hqkrkGvcAxHMK6abSXYlM927jI07QfXESzwWar6ftP0rSa1FQWXwCv+Z3qj5sXX1mfdK8tX7XJagAxmBWW/EY7lM50Iu4MJa1Lrq9CYApczg47FOsxLflwKy87lAuEW1cHvPIxIkRlLta80aMaZkqUw84gTdVwG6ZD/uG0QfskDZ0Jnomy7Wu53B2idWEd3xh9eQw3AQAPTKPMFFja53P4a7owC9/QcR9gzRDLoBXsE8t/H4fDcvck3INMutFxlfPnbkY89c86IpsnZMjnqIQOKJnrB19vE+C+bdbud24pOVxKn+oeg==</Encrypted>]]>&PaymentRequestHidden;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V4JMgLxmlt9dSbVFsjGp/bOPe1Iuj/2cJCrEplWzYi3haj2qEAPSouDLWALygI7fhmRcKan3KUCjal5PqD7GaGZPjZ0cb36OEwnb6YmTNQD7IK9Avra4zEqPFTCK7eRWTpCZDnsjYBhpzX6IzFnGMhzl25yGcZeBuO6EpAtUrbkBnvoFQU1Ekj36tA02pXYMtPbZMv3HbZG3ig2mav9bzQzhHncJzm497MmhH7uTOF2DVyiXWIC+E0/pAGMZshi2j02WfTyBGE17UCiD6jcJkxu+8XuNrSNRjwM3fZLZGQKznzqzjwnICZ2AcFU5gkdrWrVTsGv4uxkBFr7+buNxu/TJLawdzGkGNn8H2WBALCgpxR2HoieZ4Ee6jkgaYQXGFyixU3p90DiOyQ4ajxECKCtrmc/n9/MKuKO14GgpjQG/BVz27SBC8XS24ooxk4egbx4aK5o6xaz6/Q750lw9vrBw2bag9KUYRwnSNoT4RhQnQcqgSRTRsCZvvqTcrQRz2T3IFaOeBSTF5tQzRgO43ICgrRJYFkPtDmVVOmo1SLX8zO7T5FtnJti8Rs7EaRsQl/QxtxIVuX4a2xDB6Or99pcjiaZoYPna8ekoaSSsLifkiL3HLG0evifFZB7ngFfpyUU6NeWHTVX1zoZUHdilddBbkEp7T0b9EU5GNyciZU9LKL82PxCERUrzusPcyjQo58UsBaVc6JUL8CqouqWYNLMhHvpzHX/7A0nM888EvCBlnoKkNjDPBpmJkKUdMzem0LvI4BXdDXtX+9ToradM6u/HqLUeLPgGbYazvMBJXrebVYG8IJ9N5/I9BYoOaUIu6XJC0lgjgLQrDT4B37UmPtZASuTirAsN8GX7pQK+mtU9NJ0zpJvXkzE9DE9aMJ10XQlHBTFZ2tRGlSmJLwUQ0uaJ7aRL2zdLwheiV8z5caj3weDF7scfkcDgPnm8KVNQ4Fub9Efmk6/xy4RK2Imm85yTHShdd2th9ngw3vZnOA7pRp/fxkwsRTRvCeuqFSjzxEfsmW4TOGwg//bg0enT19ZbjlnxM6anQia0ZvuIxaoUcrTqcJEadjmGWRo27yFIxtUvqpgLsw2yPcxbTnzd2wnJ8eixJcZ6foLskVU53nrVcsWWfCbnaDbiYNu+NHgTaoN2ezyg2d/c8TPkOx0D6Mn6HHdaIknGryGOrQlt6jObD7TtSRGmM2LYs1X1yaQ7w==</Encrypted>]]>
      &ScriptVerifyInputVATInvoiceNumber;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwddkebjQuEWIiRC7gMr70mJ+ZhhiIh/S2km6rEYl1T+hoEaqPYobin9vVBX/J7Fy1L4tTVsJ578yH82kX8cYBNEbhcv2HBlCDiU9UPS3gHqXwlhupkrfWaboCF5jZwaZwVVF0QgQkNc1FvhfIVdCQWC2ld0Y4aLpSSEE9o9n1Hw4g56OhyshBltrD5B4HKgCD5nLDSRkIb1pExP8MjQ29nhQ=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>