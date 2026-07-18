<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + @$taxCodeInvalidConflict">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;
]>

<dir table="dmnh" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ngân hàng" e="Bank"></title>
  <fields>
    <field name="ma_nh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã ngân hàng" e="Bank"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên ngân hàng" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99CVc6Cn87YqDznBuatFkUyiQXP9kfT9WsOeik4CB205qq14ZH7JE5HJN4s7g2a7uNA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_so_thue">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="tinh_thanh">
      <header v="Tỉnh thành" e="City/Province"/>
    </field>
    <field name="dien_thoai" >
      <header v="Điện thoại" e="Phone Number"></header>
    </field>
    <field name="fax">
      <header v="Số gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>
    <field name="ma_mau">
      <header v="Mẫu ủy nhiệm chi" e="Payment Form"></header>
      <items style="AutoComplete" controller="PaymentForm" reference="ten_mau%l" key="status = '1'" check="1=1" information="ma_mau$dmmauunc.ten_mau%l"/>
    </field>
    <field  name="ten_mau%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1101: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1100: [dia_chi].Label, [dia_chi]"/>
      <item value="110-: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="1100: [tinh_thanh].Label, [tinh_thanh]"/>
      <item value="110-: [dien_thoai].Label, [dien_thoai]"/>
      <item value="110-: [fax].Label, [fax]"/>
      <item value="1101: [ma_mau].Label, [ma_mau], [ten_mau%l]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1dbdFBNGOdYG5/sKvqA/2RnlUncK2TxNP/23MAWgS8xP3mgJEEbUX54lDriJ4Hn8UY=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvOHtlJwUO/yUOeEXhI9ULGlM8iFc+nkIQ4xePe/VtFkPqVTnpDu2QTIzeR2ex4kGqc=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIdz7F3ZzMV1jphNh3v5aky6JQ4A8KtJ0u2Ggqz7zbI0CVhqZ9zKRru/lsP3Kxz92SqghCtkk4rhkgLL91XN5WKW/7CIJ+UTV1sSd4LgzPiyygCQzSl1SCx2JN6v+YBu73AGFIlbIHYDUfDOgYJ6wHl0f0HS0eC4Igthy/XmoRG6ZAE/GaSNGmebr/nBOZNeCEb0O6NuOaNCz0ZX0M71PmkL/kWSq4M6VjjtBsGw6/lEvH167abXvc8PJvvo2wHK9k8Ttt77MppfLsSNPPrsbGjtdW4cQ1rjvwV2bWb6bTNP76df5p2NN7+SulO/C6vuMETc0THHeuPWnvihnHbZ1GGQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUk2pfKoVUgjCyU1KkOwNNyGspcP68M8eEWV8ujQtVr+LxNaOULFkS7/Lc9x13TzkTwEFrcQK7Kw821ll2QK2nXDrW8YG4iFsGtoiSYIUF7O4LipoNGFUZ19n8GlLsgU3LNzwntZ+n/Ub+m2lQHf8eXNpteq70YeRxro+i+pMxavU2TO9cb/vhVd/dJBWDqrcuXhXLFbbQeN0QTSqqCoC6nuf9v60fk1wWDpBdrRbaG8c=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLulFcBFU2bKHSoYUUPaBtmMpbY1A1KULnCr8WwKtqvHsUWaGUP5owbanUvcOih+hmXNMXT69SG8FP7bGOXehAluNqvBG7LDuaxC0bs922kOtqeAQBeqrC9mlARxdKGPRO6Dz+JD8WOUdZ8IcvXh916q3uMoSP41/2vs2hv6kPHo42/JNgQP2/1vJvc6x043kuXXP2gtzfObQSaH2hAT9xcTc+8RDMBc3omC0BbqskZ2uv+S+4eAXOIIlxDO9/OAS01rxcLZXkLDxMA9/b9SUHUw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVxdSZNdUlyH89eCz0UUw1qcFGsY4enB2aG0Ejt5DW2p0</Encrypted>]]>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptCheckTaxCode;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtX/tmtjxOVvAA6xs/HdjJnSXhQPa1J1ZYllPuIin8B9k1sedGQZ+/HIRqRHPeIoC1jj6guEF0hCMovfPw7SuL2CN9pWgXHEZHJ3yb8LZfDb4c0GvmuLOWU1vUTYdfvEh1fo0lJk7onVdwg2SWVeILamL9W8CHRVSMLe4BTJ02l+pXfbrJGARtgr2nt7NPW7xqW+HAI12fNE2Zkc8erPuuBwuayjNcyZSgd9yUp1ZqT/dUOchAYfySXAEIypNzTow5c/kCb9j3SF+Jrw8iq5FTaDEQ0Taj0womRTZTx//z4k4szcvFpdOWHgSU1r+38TSZEMWNg1hQZmhP/UTsxG2/SG6zpuJtxiYaRTcivnRLyKAqDKzobp5B6YYKoqjFo0Ab67Vio+xx9Q2a+wrMRV+kSLNXXz3RK3qmlGONeWLg/rROpAT+Ec5wGMk1G49zRAtgi0jNoVUTfI1O7fDc3RV1bHw/5tndgd3V+Rbhs1C5Yt8</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdSRYWRj/XH/UM8voPwGljQ1LXbqa2bku+j/AAwE/hE69gRc6JSkkzlaPOpnY6CsbnSLK1uYbhdOstMeGg313ZNrKcgHqr5ATt5rpm0Ytj/sM6zYIixn5B+QDpp9EdZo6eA==</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7J6iW+rNza+5w/hJUSp7FwSCpQubG0pWVg9rCq/Kjn4IgNh94BsLsCwde8HwXuoHA==</Encrypted>]]>
    </text>
  </css>

</dir>