<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="sfdmmay" code="ma_may" order="ma_may" xmlns="urn:schemas-fast-com:data-dir">
  <title v="máy" e="Machine"></title>
  <fields>
    <field name="ma_may" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã máy" e="Machine Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_may" allowNulls="false">
      <header v="Tên máy" e="Description"></header>
    </field>
    <field name="ten_may2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_cm" allowNulls="false">
      <header v="Cụm máy" e="Machine Center"></header>
      <items style="AutoComplete" controller="SFCMachineCenter" reference="ten_cm%l" key="status = '1'" check="1=1" information="ma_cm$sfdmcummay.ten_cm%l"/>
    </field>
    <field name="ten_cm%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_tt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí trực tiếp" e="Direct Cost"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8SiRJCZyvuy2YSEIm14AWClqf6pVT7eU2F0xu5kJ7dnbx12r4Tgh+LybM9ow+IDBRo=</Encrypted>]]></clientScript>
    </field>
    <field name="tk_cptt">
      <header v="Tk chi phí trực tiếp" e="Direct Cost Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cptt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cptt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_gt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí gián tiếp" e="Indirect Cost"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8SiRJCZyvuy2YSEIm14AWClqf6pVT7eU2F0xu5kJ7dnbx12r4Tgh+LybM9ow+IDBRo=</Encrypted>]]></clientScript>
    </field>
    <field name="tk_cpgt">
      <header v="Tk chi phí gián tiếp" e="Indirect Cost Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpgt%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpgt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_ql" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí quản lý" e="Overhead Rate"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8SiRJCZyvuy2YSEIm14AWClqf6pVT7eU2F0xu5kJ7dnbx12r4Tgh+LybM9ow+IDBRo=</Encrypted>]]></clientScript>
    </field>
    <field name="tk_cpql">
      <header v="Tk chi phí quản lý" e="Overhead Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cpql%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cpql%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cp_dv" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Chi phí đơn vị" e="Unit Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right">
      <header v="Công suất" e="Capacity"></header>
      <items style="Numeric"></items>
    </field>
    <field name="toi_han" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Công suất giới hạn" e="Critical Resource"></header>
      <footer v="1 - Hạn chế, 0 - Không hạn chế" e="1 - Critical, 0 - Not Critical"></footer>
      <items style="Mask"/>
    </field>
    <field name="nang_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right">
      <header v="Năng suất" e="Efficiency"></header>
      <items style="Numeric"></items>
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
      <item value="110-: [ma_may].Label, [ma_may]"/>
      <item value="1100: [ten_may].Label, [ten_may]"/>
      <item value="1100: [ten_may2].Label, [ten_may2]"/>
      <item value="1101: [ma_cm].Label, [ma_cm], [ten_cm%l]"/>
      <item value="110: [cp_tt].Label, [cp_tt]"/>
      <item value="1101: [tk_cptt].Label, [tk_cptt], [ten_tk_cptt%l]"/>
      <item value="110-: [cp_gt].Label, [cp_gt]"/>
      <item value="1101: [tk_cpgt].Label, [tk_cpgt], [ten_tk_cpgt%l]"/>
      <item value="110: [cp_ql].Label, [cp_ql]"/>
      <item value="1101: [tk_cpql].Label, [tk_cpql], [ten_tk_cpql%l]"/>
      <item value="110-: [cp_dv].Label, [cp_dv]"/>
      <item value="110: [cong_suat].Label, [cong_suat]"/>
      <item value="1110: [toi_han].Label, [toi_han], [toi_han].Description"/>
      <item value="110: [nang_suat].Label, [nang_suat]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNsjcNw4zRKATSYfY2PZdBa+g6sXW2RoE1uQH+0fik+/jBJXvG17gI6GwODumtEX0tjGu5OmWlC/YYLEBZFu9ROo+bHCp0OLOUmcBlwqnQyq</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAYri7mnz7OGnLjuozYkHmCM6yeQTdAHruy8tIrxqxOKYPmVdtHrPYTDmBkt7zfBlYOndKb0wyKv3N242dWrQm6Kusm9OZZOCwvX+isGiicv</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGR+NxtcHyR40Ns9NHHbm8BK6ND9e0fOA/OzCG2pRw6oUOPWDjNDzKPgSr/xsSxOW+vIWvkTVpdXOIvxJtWpJj5O5K4TALI4DNV6VUcuMgFw</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIsrW4aGXruQpeCB9Lcky8I97TJbIDjWI8KseB9wndQDmzMyEds8KarYlJBNjaJ+y4JZj9/9Wi+qrL2uQPeKAApxmTmxrdKwEfASckOByAt3Nc/MRcSSiftPDZziJXH2C5jMaKWCBP3R8AswNSYJXC+I0Ds3/Ofpzpox/VaeNgQ4Sulh8ZBC387tqqMgKtq1ABGYPprgYuGfWe0AelkzF6x8GraBbvJ8WX3bq3ghj8GxR0T1wc9cevZu2lhtfnDeTJAtTreLTDrnxP1gM16UnfKP9viIB/cMt1NVYNuuK9Qlvy1GDjX6R/S1aJuf0mGWhFqXIPI/j0loOTZ200Mqwwlw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CxCVEHx/6uJFXLFpRMzpBGqFUgbXlgaBvE+U9XUgQV4vWOPBqY/AYNfCUUKC2tCvfjTfG5folEvbQCyiGSWvbfJNjTHEzfD0ofsf0iNH982cmuxmhkreEgNy2AKApi4nVHQP/sPjVMNy7ktGJLxG5iqCmREDkNKmanHJkezMyKBb6O53W1R7Vklgcta2EsftG/a0WjvFbDJR99s+0Oo1S8g9ofT75Z/looAIXiqA2Sqo=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteqT1DCHW+7rvOD78DJr29cndScQ/YGaOQbldG4cdW1RFB6VMcsQIKvzOBeTuNG7u1CjRzAbhxMK003yzahURQR+xLW8yxQbFRPjAcoJN7RrJiDJdd+y5sAoJ2woMP1jBy5ZUVMejPFanzINGZwGOX0DIBX+WbyOTROoVnLe88btAPopnfrAkj+ICn3h30Wei3nmkQmB4fHysW4AfWRR8x0HXUxdKjlw1v4iyrD8ZuOfByc24tYW7inONkPy2X07qf</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVwFVJCgQoEvbIYhSE2iSe2Yq8GmuLp4Q42rypjl5IVva</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtbedBYkslAa1vfzcIkZVzpol0UQTu6UWrddQAlTpZjz46fcQ3DEaTEdTeQthpuntceHE6xkZiYnVCvlznF5q3QWMiu4BPdaF5PqUXtnCMLSt73ZW3rfCn2B1iQhgDlzJfXwSBqChQYLeyRO4N+N3TUbFg9l8Yuu6rsaKpY4YTyyCoMfc10fjEFzCzXWIO9Vtf7Mot9OAqRZoaz9rFdcZ8KjsURklpg4RWA9SRccDAlqZzmafbyMp+/z57PYI3iJl4SSsPuOJsXq1o6oocptIqp9X8H2ZTnfiOfgnx7XtTfNpFCXzGKAcK83d/ccx4crUtIgNUYMZQtDC1O26mtkEcbDGjqSaWW3YBCR0+Eg2NZ35WhWCWbE0E4v3i0H+6fWdBmXT6Vos0OWrcz7ubWvJ8EA=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>