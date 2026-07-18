<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Identity "Adjust">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;
  <!ENTITY % EINote SYSTEM "..\Include\EINote.ent">
  %EINote;

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều chỉnh thông tin hóa đơn" e="Adjustment Invoice"></title>
  <fields>

    <field name="ckey" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" allowNulls="false">
      <header v="Mã số" e="Authentication Code"></header>
      <items style="Mask"></items>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="110: [ckey].Label, [ckey]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ6Z3osRRn7IZEXHQKbH7bvn00/BFtMGq+dcWebrvfFZckZWFj6+brozhXojIREiKnvdyyfAMDo/e8kIzJw+aq4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGojQ5ADIVEBaLG64gVmGQhdkBivJJ7HHq4omPmMEuFD</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WRjX5/6Pf0s6QTuF9Uw+uMyDWutOvw9S7cnNV+olGuVc5+C5XTHkKRWKwOPsG58SCLPBvqLe852oqQL5QH9G+sxp/DucQowk/yPhZZxjxRqdnTuUOj1/nhSehGBq1zuIrT4g3tJWsXsdyBedgsJgQH4rj+N0IvpWGC6uJeo9iIMRsbTqPlQXvGX/geBWAh+4veoRrLczTTWNoRUxuxMTEk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Tvd2u3g0XAnvZmS9EIZCbw0U1/q4GFCn6Xlh0OPCNtx</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3RgeJywgl4Q1nFpSIDOiiWKmH6poeK2+1zV9KqTmMJIK2zIi+v5L+XuTWTVe+yaZzwI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgENDedfJil1w9lawBzPZ6B1HGJOPVP1wEqUnybcn/bOip7M9M6D9nL+8UlF2nsJ3bxeCiajulQpcr3emYaJpNqUlkpgkjMiQ8A/Z+wgRytZw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrQiKBZ/ItM5niFlX7/stf7dZYQXtrDLphXldwDT0dX9iN1hlpzbEITxa4AE52fElgGPxSYFRBAozKQEzzCQuwpg=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRv/MctzvTJT9MrMoXn9GkHpX9gGlPi2AmVLUTC0GsTyjAI872BX01mgNghyocDI81A=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p998HqN/+iN2het+h93fdC3xpJYslAtNYNlklWocyHk+y4z4PLZZNLmj05DS4dnlVzCJVjJBFZOGYqXIK1T4iCJOluCk1hQfe07nOXpIB5+4Beg3AAjLFMHoDTfh1sgSfPOmZZuL89M/QBSbfjO9pvT94ixuw4u5cl+uRCmd7pg9Fr/k338RCG75UNKJYXEWkWEmmKZVfqQN2bqUnzcgPu5K66aG1crzMhtOLLf1HvGF0z5y08FimIj3TGRXD7FB/0tls91HLCBf+PXFrFqO6F5nbZbatomR0c6abZgHmPKdC8NkNMwrub3+Ieu9SKa7yRO2d5ZwEYMEFK3FOlAMeQjdBpR5R0ZnJI33UlZImm7JWaxArL7zgOj+4a4LYx5M0AZ3MPxAfgZC8KezHQg4G+yky2/3el857chWTJ+icy08/cVmmWXremJBoTIdgei5vUXmAnpo/a0qrJ3dVH73Exd27G0ncG0JSHfsx6hfPd174NFOYk3T1aBqh1RYw/hdfwhtCehaZDt/0C3FtzF7nJE8vjUzQnLn1xqTYvbMFXWm7vt//8J+3LuyyIjZ2zSqVuvedc/acP+TiIZtU+Wy9zdBPldRLbaxZor+xAWMOcdpNpWn7JAI1J9uqUV8faDJBPWGKddzDEGGCxCLPu0pYoOuE3fYI/6aza0IVGuaaXjWQ7HGuCg8PXEKK5DMCi+hMCRPcNZb3g1ovQ4amFbry9Q2B2D0xNMVpBbw5vK0xEFARXdfjlhD2D0uVGIAV+SHp8hR564iO2BEXD3jXep045scbE9LMvC8+7Axih2Ez6c4uI=</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&EINoteFlag;<![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QFC2P1K/gBCoiwOZkDh31ai1fCIQGArLLgWYzIt0jkoA3ZEKBPlJiPPYEi0MzckhshMilJGuklUNMkg2yeYU1NuSOA8kEv+7E5SbD/9BbczTKU9uEypmpqy969XqjyQxESW50I4KT2stDBpH5S0kPdlQcJNh3yxzvrgOfCaXURzmxEy2qeQ8+xoM4nTBEzZA==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>