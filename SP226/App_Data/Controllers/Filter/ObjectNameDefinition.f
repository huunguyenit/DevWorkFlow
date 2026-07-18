<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir database="Sys" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Khai báo tên đối tượng" e="Object Name Definition"></title>
  <fields>
    <field name="ma_nhom" clientDefault="01">
      <header v="Nhóm" e="Group"></header>
      <items style="DropDownList">
        <item value="01">
          <text v="Đối tượng quản trị" e="Management Object"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11000: [ma_nhom].Label, [ma_nhom]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iBfv++Nrv2QggTpPBJ02JHP4mnUNdv4yG53FtqxoCp9YxVDDTyMUo/FIimD78wN3vzmweBmMc519C32BThHb1sRFALiwL5PkAW2/3pMfqFW3i5mxsRZN/rheev0OWAUeP</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp+Rm2z/HOqmKI5Xh9MvFMhAPQRs2APmziiTnmobi/f5+KyDiJ9l9D2wpx89KWQG33EMMp9MyuJxl2olPD5c1yqF5k5ls+2viGNx3aj2fX5f0T1gZLNrFkv/y6l3ngOKQ6HN2ujuamAU4i9hcetmPFj3G3YzX7z8hFx/AJx/Tyb02cZIgEHN7Z6msye4pi6KUfk=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPbokxCzJ8/S6IKQblxdcApXIoj6+cwatWHKNo2EqBme7/ikmSBazjgxLLMEvyCXmrs6CSuzbFEa9fH6Uj5JK+D/TKoyvgpjpVOS00PKA7iD7vu9bqjDd4E9EcrN0AcI3rC8JIlpCas73nrw+VlWZBwGgeYPnZqefknS799EOJVSgcPTx3hQosfFLZfqtUIGEtJWF7YfpIJDMy/ray6vJeWP0rqwtwhKtrS2yzYs2kglEoPc5LLFIGVHkSR1tvzLY/MDH4rUfM7VsOdBH6OGOM1fMxODdJ0PMZ9dhJ1x+Y/GuoaPOxgArevClZIfL+ORKjYB4fLJ1sjf18TbWQFjgkUV7apEtGPNcpPtnpSQUMZcg=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>