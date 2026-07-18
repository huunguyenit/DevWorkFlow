<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "ITDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="d85$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+1ZinyAG8T7kDc/L8uThKSQD70ZPMPLMQT9WlVUGrTVfV8TqcCujG4EACapTFShigX50sEXEPoPl4+r07y4sL9lrk53rmrTTavkE+UVkP/Pw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouiHwnF/5cGuyztb5FgU+/6lRK7YdRPkOz+ZOaCD9LFeFazobuKWl7vluiaaBKObKEJtKg979tEXAErnj37bqfwsYCJGpiaCHJXR+kuqzlxaLWvWbYEyY8r/gVbHl6cHirpvdxUSGvb3EYmQAo5tO0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKzHmpq1NMHCpGxFxLNVRPuV7aH7UH3wkeIrYGNInhIWGqsfhPVfwRNTOZo7w0edNYd8LZkeOvy8CSAfqiqPya1yub5RULGeW+DH0O16YMVWHgdJUk8vrrki7HdXxftMZO5tca7S2i/kNngRu3idNMuu3ZUJU2+/mzBmBYZYSQCVvYwroJtPGMr482uiWR5znMo6GxoxHUydwVEYZDibX9u6rDziH+l8ky9xkbZLGFr4MEzGc199IMUW0KaaoGwuk1b9lJgxtwRFiZ2A1caMg4wOO/OljLA6RZ6ohqeRxL1lLQs4eRLq7tH9gF0QYZaSAx4T3fR45oWL2AfaDTbPuTBowsQVvdBCZoWjiuAgox7U5MGBIN+SNIBFU/yqYV1morjPiitWEedpfociC8/PBSwOmHY/xT5BmK+l6fJV8re4L1L5nfMGAD6D/c4JVt17Zi2BWTFiMhzRRCSvfV8HSpWcaM1fWYDhIK5+PNqirc4X4Oz2OJQdkPLUm8P6CdT7s9Kne46iIXQe0m9X/B+01G/jq1rxMM9jkz9fk5SoNnZmcA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv68or3FcNmj7ejuE5G5ZkszzD4U3nP63hi+G31CBzW5iO3bqQtYKSkO6dcHlSOgMg9uRxmA/nMRlm5k2mFDZ/owg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh1c5NwyGtIqERRGcxeL0JkCgAqBNdpR8eQ7iwuFfFmgHgi7M6D3/+vnmrwwBGR59fqUv/alLlGpO8YbwshYURAKYQWw/x39i4mwS64/8aHGgwq7dWFxPMzB624tiI4gf7Sua5rs9hQAD6A5CCoEwDsvEgDOdUFUZ4kZ2zctZPuebx/35qUfWsbC06wwhIHueRV5VFlKTP5H4LgmYA5M3Oqav3jgdgCvTqKTz2l+lMcljnzw1Fp7iSpAmHVZAfaiPG3pnFX4/jtiLmaa+5Zn8lho7TxIkvsevPM2raqJc/S83</encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnlgkiUi6dBFu+VLE6q99412LD1P+4vBDxzZ5hJf2mN1eVMMvv4YYJC5p2ShN3+kXFpdCpCDsjjRP/TAkTwm8nMdpfw37qZCsAxy5AWpsQvUi+wgc+niPQual/xoW4/hWWtXTiKFuIlORlshqgFQPeWSVxDMYpoSrVlcwCKCX3tNNkIhE/CASHnkvBNfByOUCg==</encrypted>]]>&ImportUserDefinedFields;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV8SZnDu4EJszYXEcpc01h6p02G9RUOWAOT+jDPSwV6OdAmYGXolLPOlWcuj5C0+opcXcmlfeWY+lRA3TwvG2XspAIzNTVzhi/zfAM+UvVwmoeGe2GWcv2vSNP4O5KgJjSJYU3lbtbkdaqmv9M5GMb6/+t/n1CRIGNTymgnI8PeHtM2LJniiBArfM2+cFvOqgUKPQYB+TBPPQ5AqWtXPLnDUz0Ox7tJfcHuUVR3wLhv33tq3gnuIwatLNAFTaW6dTzwKdq9bSpuWJ+NFAaKV2gEjFHA7Mn3tRdQjn9SBndmg0a4L0wFFNz9x0UvLMTUZ1FrfDGNIQ7Z6o2pSBRUhwsW607J5/1TsZnGpGJpbl4eLblOBzKxvWiPSuz8MbT/h+7XEcqlcNhh2PZqWJs2m7fNAKJ/+T5dNH+4UZjHGPjGQZ2/QvicvJgNYuNfVE61c5fIVRkMTeEnC5RynUMqxG9A5FRrF3x0D3BJw+Vwd6Z6MuTE3yV96/PrTjYvHjM4PGsvZjbL5i5kU/tHqD4Q7SCssVwoVX09IYI44wqBPCKOASxYK/veGGKphh8aTCnbTrjD/NxQJ0srXvZAkesW1bgZQ4ODRopSExDPH/3nQz2FKB</encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AV9/1MhqWomQQZRwS/KCcARVbgo9RCBaeYlBI7cM4PvzPNz5Wnpo1SHXL8V1wjcOCKF8p7iZQcOsNnYqK6KZjYNPtua6A1o3X3dduIJ8jI8Gf9grFEgKyDqXXN2TaVcB/dFWLqONgspNotRFzovqccAJAIjev3Se/zFAGQ67C01rbymw0hi/bEHXedeLDeLqVfXqvMTzmQSf+ONmE/b9bwPDenCUp/GSH22VtdtPXrAFGbcChLfR4F+96yIpJ1HHY9WiPJ38+3ULVsBFrY3v4Tf8M6wsUn+hfVo4462Yb/b9Lsa+FQFemwZqRALTdDg8+9kIWvGnHkp4/3zXwS39jDRS2M+evk4jRUF72IDsgyYxPT+ucxEwJ12JzV01K88tz6PF9VvB1Vg29M+d4meTy9Vn9wgyUHKK1OYN6CBEOu2mXNiN2LPjNQypTbiXIfrRgQ0a7o1wRgmgiYMTy2RzzyVVYtFZqnuauFziddzNF9NQlSQ9RS585ZDnQyhM8tOTn7YHngksuSgwEtMhh8gpqsIMTMuTyqeTh9rNg/G6Lk7iESmW5IU6QP2M4mGRKfac8ojnRn3pA8s9FjpQNTRJis=</encrypted>]]>
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