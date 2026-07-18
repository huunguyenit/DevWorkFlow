<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "IRDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="d34$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwv3wLHXTDVbx2DdB9PPcGaDBXwbv0oh/z6PNxPtXBr0B91Yn0501vvwtUQ50sTOYA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+1ZinyAG8T7kDc/L8uThKSQD70ZPMPLMQT9WlVUGrTVfV8TqcCujG4EACapTFShigX50sEXEPoPl4+r07y4sL9lrk53rmrTTavkE+UVkP/Pw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouiHwnF/5cGuyztb5FgU+/6lRK7YdRPkOz+ZOaCD9LFeFazobuKWl7vluiaaBKObKEJtKg979tEXAErnj37bqfwsYCJGpiaCHJXR+kuqzlxaLWvWbYEyY8r/gVbHl6cHirpvdxUSGvb3EYmQAo5tO0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKzAmyibHTlLL9xWQSAUBr7JUvDOhBGg7kWbLaLSRy2LWaip8BA3EEgTCmytp45mvJOwTQ9vK7jMuYpJ4eLFp/UnVRL8JBsJQybdVrOBeBPfdz58xvmjfuNEDYmTGx1P83n6nNiq0c5rW7F0ly2OTCJSBs7Q7v9u09rMutyNYDJ9sf1iRLe8YQqdeiVmVJ9nBK2VwRDFhbtmmJBYVl6T1luJcadwZ1PZG3IlC+YFQnddl1Hhh6JqKGphhc+YqJQBVOJ3xHiKSICvhzdCSyrLqOrYxyPVpb8GIx/8ajAhLinlNNFbRIssKPHqhLxo6vt8EVzVMfQcdGy/dDyzAh8pQMkuMfBGCNj5UeCQBX8PP6b34xl7NQ3qF2/Q8MfHQvcuSOffullKl5gmZkSrEbksip5aRcl+YMXorIOYnKixt5Bq0xoMY2ZeQkyFaLLXwCC2HS/AJRRMmhTp129D+uXakuZjEoJrKyPcaETP2nQHjlinByf+DiZzZVXicwrCSGrmkDU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv68or3FcNmj7ejuE5G5ZkszzD4U3nP63hi+G31CBzW5iO3bqQtYKSkO6dcHlSOgMg9uRxmA/nMRlm5k2mFDZ/owg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh1c5NwyGtIqERRGcxeL0JkCgAqBNdpR8eQ7iwuFfFmgHgi7M6D3/+vnmrwwBGR59fsDAZiQudDHqvqUkq+aKvneKH5ViwIPs7peOg95qVMk5Zb7Qf7usQYRmGtq7Q8b4MKtjNb2R/RKxBohzjr/SDBRl7OYH/m9chlSK40LUkE5R0ut6S6Gn9PHY1Aet+CWK54CoZnMrq7KVTbyINQF0DpU6E85v+5PkTWBcfgVa1J5BdUpvyEtUACbatzn0JWN6+w==</encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnlgkiUi6dBFu+VLE6q9940LpM4rU2kpvwV7r1ZE4DQjyDOHacP1W6q2V7b8wx0olkj78R060aIrMQNSObTjnk3SeZUrcigiUFTTA5yZAZRhrtTKRo1uoO+hO9kI4czInZg/vngSuRx2enHTqdGvl0p2oaKD9YPAFn7GjYgAIfjVXAe0IITTr2zKuuP1+CMXpQ==</encrypted>]]>&ImportUserDefinedFields;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyVwfC1XEsjIFiFkY98ryx+qnL6XXSbL6ZKisJRHw4bZq2tfxqQyd6ptfPC2JxgmaTDXeh3pIi1aBoXuPzXk2nq41Zz9HT97/3tHrOKjJOZfWjbf84j1enP1/fQUcOK1QsgjpyxJl4tKGKFZ2nu3yZY2aZlSllQrp619Nz5dyeg35tLBZrHVRZp8g03LjM0FCchJp3gJ72HsTQ5l+EXMMNoYu5lEa03MdC0wULtam+nLp5cGLcqKTs9f6aBg8I5J/P/OtCV42IIiVZBxsh2m5HHJbAWSnq6RdwqykHh3rKkJ++3VqVmLvmSE2hqyR29/e3AFiXNtV6cMb7SE35WqepV8fM0kbNqCrz/LQgC4Hqd3jqS7e7cbO7XBUJpo5kUQj4CwO3+xghFStFRsCEHZQ3iM7pDOMzIevOGOsokGToSV5KaZ4fqYJ+WakxXwfRLW9oty+p1r7ZZw3qKRfbuxwp/hRi6qVdX5CC6SQ2ffqbxKkx0wfR9tR32Tc7KyjtCa4QtH+RjNGTYgBpNJQzPwhvwc4h9943KGjH/FX3FxHttUYIzLFhCOJL6pqxGQetAnh59hiiEEuMRcG+D0SzhsmRjpQ=</encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kur85pqay2iCT4kaE2T4eojES8cOMU0l8wohRcnBTZuMQjgeLo9KhwwZnkr1aoHaCrxIlAtNFhv+qvBRkiO3h9/FptK8v+KK3SYN+V4ak3u3KMXq6BcW1hAeSTv/NSJVF0hg10AMCHHqE9fqLyiCnQUHK31MFeMZH34oQMJWttQ6CxYNnaIWyGE7cU18EUciK+H96gb9JAfzc6pfmECocs75+wqaOpPuH5HhKCF26Dt3/QUtJM0MNigcdy43fn9+FYO/nFP/9PgXmnBsM6XjCUC5v1fJ11WPC5uCWNwPLJWvVCC+qC8EylLLxMsKxoYbGhEBG5WTJVAfqjYSBEro1wW1Z11jek9fM90VBD8P/bT/xK//s3lugJB+cuX7Wb9Sq4xPZps9NA82jDv+z/tM2hZxJIpuj+p4p3f99IE64HnDHOCjDDlcsR5AwbY9LgsfqB2zd71v5p5atln7l1M3rctXFC9dhRvmnqFIO3ozKskkzHouReh2h5hiiogEjehAi5sZwbAqHYV/kI4GEyHB6xMaV2kHtvBmmBB/Ck7a7CFrqZ/WzVP57VRJQMnspdBuHg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>