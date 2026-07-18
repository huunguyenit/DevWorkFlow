<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
]>

<dir table="cttt30" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn thu vượt" e="Select Overpayments"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" disabled="true">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="ma_kh" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230, 0, 0, 0"/>
      <item value="1101-11: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2], [ma_kh], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9WnoVEA4gIrJLWeVVw85haV4NT6HmuWSr7f5QV8bG9J9F/r4FY2ykmlXiYO96OU8jcqlMU+I8OCnlCL/JISNDg=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eTCBj89aAZochLNfDWnBza1+juKkxiFFQeOdfhuDY1eMK9jABK8dyTFd7IhLI8W0Am3wQw23TyP0kJeYnAtmxiAzIsaHU32Kt7QY9RDb7qej79v0yy3KW7pqINqkKqYPTKLN2LrkBm3/oOUKsj0NCYrHA6bz6Igl/7HanZP2p3TVZvQ/dDtgGprY8TvyMf8cOUlGXI4HGg+CUmoWL2jptMSflvbw+JwG5svhjc8hzSV/mLEV0m3jzaDdajF/1zkkqgKNE7+Hg8QRw5r2l/9pLg9XA+hG6U4mqmHMNm4HkySvcVMBkLG/B0Bn3B5HULf7B+jTHB70ytGtKrC/sQ3VKMd/ukXE7r5+ZaIdh2wDQqTQ+lVghIR/yv3vP6NL6aQC+b3l5Y5zFvKB0kqJf9+G041OvvdaDWIl2k3wVkDgkNhM7Oi22oW4aRepBy03H8IfNfBUBhyEpf6fZ9dGcor/dnkgXxq+MzcfCjXLvHpxz9DpcZKKC4T0OHS0fl12lX8XU6lT9jd/xJxZb8h8ExWwT/Qt20U9c8JBntB3o5jJDHK</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70P+Mob/zIG0uOSR/+D3o9t05WuJihbOjnXaxNRfZUmxgVwLDfzUN8+PxZTiLcWVDwthn9Os19V0rq9Xsv3VRY0mmb6WhlRymprYvnpbWmg2mDUyZASEQkEA4ku85Ao2Hk7dYVjRVbJSt+tO/K9W+4VZFXRbzfI2jezb4LEaFCKgcdnUmfW6D94Q9pTaSIy+6dVDnsUbfImw/qjnDz4OqqdXK6Bl6skBbVS48nQAz+CRlRu71jIU+zeRcTlhm1TVlRBepHMFzEelEKVW+c1rf8KV6iSdrqb6X16FMeHk+Spqtcur+HhOJtw8vQNTDYbQA0jN8j2U3fE00W4pyP5Fis6iAk+r7GW6UFvGZTK2Mk3aR1FXkES04+Q3C3YRyozludoBzQ5XSA4uYxrJV2VwOFhLzJUkf1/RAe1T0lM8Z5xzlbAuf8q5Emfy6a73MnJZOJuN7ezJxVi1G93IfeNcc3zx4cC6ftIXluZAvzTTQN7pT</encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>