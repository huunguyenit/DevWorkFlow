<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY defaultTable "DMMAUSOCT">
]>

<dir table="v20dmmaubc" code="ma_maubc, form" order="ma_maubc, form" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc mẫu TT/QĐ" e="Filter Condition"></title>
  <fields>
    <field name="ma_maubc" categoryIndex="1" allowNulls="false" defaultValue="&defaultTable;" clientDefault="&defaultTable;" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="form" allowNulls="false">
      <header v="Mẫu TT/QĐ" e="Template Code"></header>
      <items style="AutoComplete" controller="ReportForm" reference="ten_form%l" key="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}') and (kieu_bc = 0 or (exists (select 1 from options a where rtrim(isnull(a.val, 0)) = v20dmmaubc.kieu_bc and name = 'm_kieu_bc')))" check="form in (select form from v20dmmaubc where ma_maubc = '{$%c[ma_maubc]}') and (kieu_bc = 0 or (exists (select 1 from options a where rtrim(isnull(a.val, 0)) = v20dmmaubc.kieu_bc and name = 'm_kieu_bc')))"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2q3fhAVTRG8kgfL78wbojHF4XcHXSUA3EdRUBbacZfTZw==</encrypted>]]></clientScript>
    </field>
    <field name="ten_form%l" readOnly="true" external="true" defaultValue="Default">
      <header v="" e=""></header>
    </field>

    <field name="loai" external="true" dataFormatString="1, 2, 3, 9" clientDefault="2" align="right" allowContain="true" defaultValue="Default">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Tạo mẫu, 2 - Sửa mẫu, 3 - Xóa mẫu, 9 - Cập nhật mẫu" e="1 - New, 2 - Edit, 3 - Delete, 9 - Apply"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZdE9Eq2iM3bUhFKicqnNc2raBw0IpQ5/chFGwoEs8Hbd1Jr3Xc/ocdPgfx50gSGqQg==</encrypted>]]></clientScript>
    </field>

    <field name="ten_maubc">
      <header v="Tên mẫu TT/QĐ" e="Template Name"></header>
    </field>
    <field name="ten_maubc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="xoa_yn" type="Boolean" external="true" allowContain="true" defaultValue="true">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa mẫu" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 80, 100, 230"/>
      <item value="11010: [form].Label, [form], [ten_form%l]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11000: [ten_maubc].Label, [ten_maubc]"/>
      <item value="11000: [ten_maubc2].Label, [ten_maubc2]"/>
      <item value="11100: [ma_maubc], [xoa_yn], [xoa_yn].Description"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Q8M/QNyyhQgbtZ5e/JFp0dX8gtRO9cYmco5pGVoregwxbCGxWwie5qIcQPS5zRb1qWqG/oZ+cHh9NeTuBrNkKEkQs0CXSrqCbSZWWMg6iS7JG6y+yXIdgJnzT6RjONcIx2THLfbdjObsVMLX/UdPpYBSIIkLRMZNQe9LXQLKjL9NEG9HQFa+PZ5Jsa55X+5etvQYIyC6a4B+XxFsF3U6Ksl4TFWRSIH2/YsflDrwX9JV/hl9gMsGiDRsY47XMz1MqoIZNAonEFR8/C2TJTZvqg=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bQTkSYhKaFlDccRJRc4jtvHa5qsnP4YLuOVzVXi1sAK+K7HjAWTbz78AlrCeZJm59p24RoT/1ofoEhCNe9by1lyQ2vLEZ8RtkQSJgDGenpACQvH2AmPqBDKviyZFCSqm9cVo1rhZb5VwihAULexKZBZLv+x6bE62Yt7HSgXCiHe5DikcNrzxuAaQwggVzzYoZcggG9Ts/LOwflozTvFJgY=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf0iwzKIl/ip1Y4NsMA8QnLdlYG6Z4BkJbpo8jdCZJS3bWy8yMREunuoTS5envd40LqWNXDHbI8dGv7zgpjHnqlA1+bAA50BHF38mHiiKmWukO/K/D1hfbszacn/F9RS8Sq58B52x66rVuyF0f0117P3r54L/pdD2rf08TOsiwCMGzQ/+xYWOhdeqGth4oKH36A==</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%YOfes2zSil2bWL6UeEJSf0iwzKIl/ip1Y4NsMA8QnLfT8v0CtKGrClLZ5vaAF0iWaXotZL0QvJW3wdZFBz0MxEke58t4bjVihdwHkWqlN4C9JJbcukXfMux8WoCevqxVDddWzchi4BRMzczMfvySxDy8UrXVO9XFkoQzvtRl8KI9a9aWs/VtN1BYmp22iXm4tPFXpiHml8sKLb2RCSuvvsZ5G56mkCEbKRRQKsXowXnwH4+TefgZhFG5QTobSOGUcjZhloYe8DXE9YudZn+vIQ==</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6mYWhc4nYvR9jN96NYRh8WYaQp4hVNvQtC4sToggC6e8+SZ8vv/mPenz+DawFU+rIa6Vszez+RtRgG2DrrShPSjOIdhMhscd5D3f5N4uvzVquVDABz9q8ciXVlpAo8s9SpC9t3GLiTDnwBO380Uzv8T89cJDES6S33tKmAoOm0X</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp9whi+w8Dr8S0TqH5PZY3UkHqF6F8DiT5CZHbwjvmpi+qHa4Uo4K7M7ho/l6pS+JdldXBgLVLBemwsk9qjPOp3baOAwvBa4Fdarn1PS2qgIAD8dLk2SX91d3mXPvsii0sPXTL9RDZf5S05+KPGasrM5RKCEgtToFMsRkAWDxlH484uAltpwZ9GzLoirpHRAgYDWHPOoCO7XWBaCr5sCUmeg3nK//ak8RsvTJOuyNcU+OzdWra2smuwR2pEb1pqUxC2Z5stXa5YAUXeahRl+w35g+0tPxO8fQg5/VNmf8zJ7VnsYk5Hs+ba4St/ZPbG64q+iG0KD282t8l2sv60IKKYNMwxVOJMbdUugnv5xOZp7kff7BW5JXZnl6g5n8FZpWnjyls1D4cAKz9K1tLY2uuduHpuVxevOGAcuvd6cjYPjHZtjAjC4Euh+El3Y3VF215ZK2+wcL/br2MxdfzpLlOIo0c/ePqACyKZf4XBH5o/4CeGkqavANILbvUD7W9UUrVI9wegesELe/7Ho3cJyKdyUDWiZBVQRMnlgPxvMMMwAVek33sUumGIkqCBByWedgwbvv7tvEA3v2wSSyiKO+HHh0G7VrRCA58jiKouyoK66FbGurfHML6SRdFMPpkxD8YAgh4CUTHLOGdnlpyn+ODJ4G/7/DpM2uaGtK5CFIZ30QIRNRkZh3Zb3wXByBd5I/rWP5tHtok1NCQrWo3Z+aFWldZhuhAsjUItcOXLN5ohxJ9JryAzTxoUr4BsDKYXxH3lZJthocovPJ0E8kq72DNWr7Mn21vFabNE55vcKxro5ZV5Cf6C8Hqu32Hw38y22J2Mu4MYP1vPi4LN2q/1ns4k6yIaH3Py0zVh8f44JS6ZVKugPpmVtiX2IgUzKZ/pXL+iDW4vfSpLSWQDF2D/31iSZKU0GdlFEqNCJGz7wFRkgmLNMtu+nHxBqxaoN1ZJ2zGvC+zGUtKJKfR9/Go2t0doD8zuGzgk8Eug6tukZR00BZAuXvcFVA+SvPVNi3nR+0o6uwjBL7ltL3snp+X7VoAP+9/hqR51EBy92eaHdhNk1FVXzIpi2TbipTWhp1wsXBDtLRPSahPBbhR9p2dfao6pEeLWAO/dvKfe2j3LB2hBnGSC9+li38ZScXvDfYlrIJu6f2iQyQaRUbuH5L2vkHpvnj8VeKjQoJu++mZhbX87N5</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%2uTMUxyboXuUcKla3E6gp9whi+w8Dr8S0TqH5PZY3Ukwvlmx71g1odPGytsnucfwCosxqK+2HsddiRnmNq3lyIVe19pP23IJHtjteV6qywo=</encrypted>]]>&defaultTable;<![CDATA[<encrypted>%+JShMBxygFsMjL+5/FpvEVUFl+7ZVBg4tuqsLZrbz5JSRxSEUdbIf5wNcVaSvQLdzpJpobLvefqajaxpf5CRtQZz75ib2UQ4QNiMFjQSIuIUo6mlSMlDqgEl3aLOhR2S7HfS6a3bInBQwPW/j4x+idNNQJUxSwYxkGYk1za1Aj5toYV70XYBtB2BpTGVculg4bmSbkD8u9KJVJARmUOktHm1kcLxzf5/Gi/Ihyj+ZYAhPrGOnAdEsv4uEFPaU4x3hTaUHnKYyG+Ne74knhs2UNjjP5a0uP/GpkOzibP670V8G0pgORVjWoRWV8qAOHKT+qc6FZGCD7OzR3PLV8drFjcEtkHrGCDjv87Ia5WjtE4bCVHqvFDdMBfko45WFTMa6XxOchbxO4TxDbS0XofOMRHHZnukYCuv5iGyiT9fkh0r4IhyQj86mn3B/42ifsCyyGrbLbV4HbWptqa9DILXnpV4SQ0L9h0d/YNFfUh0+X7v+g9P5ZVG94ROI7F/we8d</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JVAU7kSPYn/O4W9vtyXO72aktO/ycdbRDmQEW0SC55zMV0E80Kb94rr0GAowturNP1/QidmH7XqVL6KX7rgu7BQxCEQOPwPpU8KIlRHfyuzID+vDO7Reud7OOmjp78RkiqxW622u9oMeU4/0ovVl6A0v4fEhP/GYMbIAY1AkgoJSMPxgvw4dpgJdScQPBeRK7fcGTV9D8/SBkIGvo8Ow6tGi9xSmQaSNnL0A8eiDZtwTFJUSUu0CLKC9qoDaB+1u8BqaW5Kmefo/gaZpyvWpSTbKSoOEdPeRIloggb2lY82quR2lie9h7TTW4fWUH8CF/SK3mwMj1YQiAX7nrP6DBL4YS/Vxbp82dSoUnxYzmUEv0/3IVg5H8uYnbg1gp+rFLGP+ERSFhrSXpeKFeHklE/voo2vmRwuD3He3l5t+53p+HEfjO6bQGli9LzYLByyEcQTfbtLVDi3T+tDQf5Rm6KvXH1H3grY2n9yl+FbhnRoHW53TlcYpEkdjvH4OnrvGaHR3SXzeOTLBKuwRIkOOf30PKl5Y6EQnXIFJkedk7tC+A2P2EqL9VIaTqFC4vnPx3YKEZLtsb822tOnA+szC+DzykcI7ztGcnxJ5HmOc0gNWPWkeELMq02dJm4kks86Cbj5UjaBtvqyISfNpM4Y/3PV7salXN8Dcd42N1pANTDDXUAgmv/9SVtbHFqmv2rjqjcihXBVMa/8IsYaZhYelyIFnMx1KfABAVSyjCFLUdbot0gZzOl8dAs2xcOw4Tc9SlYqsnjoAYH4kx0McW3dz6xu1uaaP6lcaBQXVJ72+Yo3tXe884k8z8Q74D9dz90FNSVecs8T3crr1A4DrDpp0vuutzbHv8JkyCtL7urKrbe4A7+uD67iGp2UcOEDChJsI/Ik84TtwTip291B7L5iBatJi2PJy540yM7PS2EDgVJYfcW8ShWmwPufyeZXCimNh/XIGD2YS+BoipeYiR2/WmytrH5W4ePTruC4UbRf8DRmaXyxhnids9aYJz5kABZ4lvHvJq01f73ikXa/uiTW7Yhvy8Cm9CYfewH1fN8AzKIGlkqBSMaUh1c5edis467SLA==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ReportForm">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4E1o7Is7aq+wrwMknHEW88WYInagQGulzZyMdwsO998ksTcAEucYb9eQP9qNEOP/KIvHIWvlFdqhlyk6CS7r+iEmCOd1IVvq7Vh/Fe3v45og==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ayGeBGQudaG3KaHZ9rzRUoilRlLnkc0MB/ykekvrte95hdrpMP6mtRccjSgwrsfOLQwg3opxoDJDXY1RkoxhOxv84VzGSY0OhL6Ag5FB5tu</encrypted>]]>
    </text>
  </css>
</dir>