<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="tkhddt" code="name" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chuyển đổi sử dụng hóa đơn điện tử" e="Authentication Mode"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP5I+LMRVVTCDYR0bnCpItFqWuqxrcCE50IrrGzdMoOWqQ==</encrypted>]]></clientScript>
    </field>
    <field name="cstatus" align="right" inactivate="true" disabled="true">
      <header v="Trạng thái hiện tại" e="Current Status"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Trạng thái chuyển" e="Transfer Status"></header>
      <footer v="0 - Dùng thử, 1 - Sử dụng chính thức" e="0 - Trial, 1 - Offical"></footer>
      <items style="Mask"/>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 170, 230, 0"/>
      <item value="1110: [cstatus].Label, [cstatus], [status].Description"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7e6fRThx3BOGR746IzeVeSw3c7yK/cldoPtg6B8+RjCFlZ/S0Ki94LGSTgOeT/OcpFOpweXtJDdWhd9FB0JNfA=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6f9sqt7HdB3RexwA7bFJj931W2TOaHBY5EOuSEgK5XGTGNf/AnKDudR6R3zWa6IWA2KaRwUfwp1xm91i26LNJ6NIQLv7lO9/8nfiHMrC+W7IEXor7XSN5vq72T3c1+QjjKSK+tfR9ZTGVn8m4qzwbEbmI+GbvcfyzNhsxqvXwQGVYTSjnC9sqY+5i+AQ86370UrqxcNQ24mHfiQDBSlgPKk=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6cwaZucRM/KOQefKmGo2wm/LhoCyLGmVnB48E7YwHn1EYetsK7f90HpP2nSQmsFmEq77GlwbrRadLJogDJMvMbK1YnRfbUbLvs8qbyaY8rTa3LbcWZLjUk+i+YLM0liaeDFPfdZ7M1clw/UiasT5Ry7GeM/bqwqIPPGK3/OjgCEi5j+wZTUsygWQNjRqzeRC77BGu5hjedBmgKw7yPBtORJv5T9vMDfaXa+DrrODZQWPzBeoFDn9mK8w0qsx+N0KntABRDOgFRA62KmDuYWS0SpndmbyxkSnSXMtfezTdNGaMAFdGQjr2sVSz5Eo7uwKAw03MnZxsQro/lPp+60qLBcyNI/mmvLs2oi187xcH3ouaavyLC581E6AIm0zfwQFS9rTL6+pojukwMmS2pmgIc7+Zu8GGNGsiUBH1+vrTiZ3b1g47lJsDKp3D5nmeyhV2ttj2ZRb9N548vubNx+mLDl8TZbiT8J5Q0NS75Hd4Ww7cQrl2Gyd4Og7ZqJWRxUrW8TlqatXm4RBwKGFGVU8lcPm8M/CjXLAHZL0X9PwyOFh+7FP28CWQZ1qLaFdHf/z3A==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jYgd592R3bkVDod8jSPQ36kQWma5Y6isSXpBA+K9mZKAk+xBmpXLwBCjjANPk9/PSIrVQUYr4BZRA3WJ/a5l74MKxvRaNM9/CMDa6Ctf6c3rACxM99LVZwV3RiUeoX5Xe/PjxiVQJUlDZebaJxQYdwpXQ5I/74rtsyESecNp1ifXzzXJkuClvxDK3BIGHxgM83LDcVNvwGKkf8RqdkBIKvMKUs9MHSoBrEIZD47+2QraFvHo2iUwb1zVzrfHnTlXvebLJJpEQssxwH03++xMNmI6sx/+i085CkSy1L3zIjyOT13pNRHnSxJTYMP3LbCkvx9NhHfZWdqKq4XBAwJM070H1VRNpRN64KPfADyJpHiYHwxTc+uZ93EqelBPIRoPjxGpUYpSH2xVLQvwUaEld8hS1VdcOQDgS3H4qzaHzqitHOK/q5eKuPuUpDFnQbjF15eSTOIgee4EcVPErvxkY7LCYmn6eK34en/W7MDfeHggG7VjQaSggfEWwR42S0TWrDQP1/BtbVYYdCQVIz3gnWNpo+ABWfFTy/nd8PAzWo8JaYtivCD4sh/wJ6tjSmDtCklA6OweMv6CLXT1tkcY69kSXXNXIp7IJj9FsQ9UVb64QKAUW3JPqoxlanQ7mCOgvImPUiQef1sWCx63FuwJ+vAfGMTlHiairFZ1xgd8WvmI07a1fhUFMjSWyPyJZx+OJABiVVhz9epuoTIAFQfy5NDcey4cC8K2BPRgr2my55NEAGAVPgwYkEm1cPCtI/RKHtoCX8g7bdjqHHcKm+82ffIw8L5oxkqFvnIcLg1jBpj/D3c17fYpizTpnK0DiV39K8ET72rs64U8wrnwlxCG7lFWqGmnLYadpz+udrivqATlw==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LBBxTxVo2wdYrIJzAd/YcC0KfxE4bXP6T03CMI0ZKdZ1+zdPdbcxG89Beavgv1cyHUJcwzBScUjEt3Xpu81hdJ42otJ0qi3x/NrniLVqJjAIs7+VDmnsXkt8V1gyUja9g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjmy5qh9o6yahgy9KNWbrdJTkD4bJG88YfHMdl/f9aLSkhkWB1Gm2YPkhMXE/dO8Wo3SXQ2DYXZ2sVPNfNgpzkNaM7fUxwhLpqmzImKAUTh6W53Ke4Z2oW7KzEixtF+VnpRuqXczubq1ozh+bWsnECdeKaAbpku/mCgTFLAYVTLmWXa4Xem5Nid6gCb/JR1SYG4vCcxDT1z1Zs+s2GQCbmB2ALpQvd5Nuu4LGctrooypmzAYRUDs3Wq4N0jTfdkqDXMsV72bk3lg780Ump6jJy6kYrCvNpl0lYrvYtqElrObRkIg7cvncsjGn/rfiAWBUCSxgOppVt+7TW+e6PAQQdc94b9m2lETHnE/WEz5lifYD+ESOEGOCutm2dJpt1c0qZcfugxpaI8X/Jx9ca/V2HZzB6vUs2d4eUk0NlbmdWjBSJRHEqSAutFH9Y5lMOK5TmZL97wTF4zJVr0P0DUYz/hKlUaTW+bNBNKeUJUZKKJCtY03VD/Z5G92KzPO8tnD3WuiYZHHoZ4B4p+PJTI2mfT2Xxoli6g31BMOluWBGW1h4lHRwOFBZiRHWBHpUBdoX1vP52NYktUmGjSVkGlAKuarSdxhivK24/s7yz0W/Bfa1w5/6tKBV5D195tlU8bp9EL21J8RRNbjn/ay9GE6+u2DdrC/rTT9jQWOeruIAogX45NKrfB/Aj9I/YnRBpS/2PNai+lPGf+HLDk9Fv6v28GNLhVZzYhLP1UXbL9E1W/u9nsp1UtFIlWIx7G4tvF8ZdhjSxF806A3W8XiQrd27uykbQQnjdol4p37ZiFw3Ts8bnQr34/sE/q56XiGlG72csDqoGsvD4jw9SQF2ijHhSMi</encrypted>]]>
    </text>
  </script>

</dir>