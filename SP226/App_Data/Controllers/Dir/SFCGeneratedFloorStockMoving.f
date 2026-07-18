<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "SFCGeneratedFloorStockMoving">

  <!ENTITY k1 "kind = @kind and ma_ct = @ma_ct and loai_ct = @loai_ct and ma_px = @ma_px">
  <!ENTITY k2 "kind = $kind.OldValue and ma_ct = $ma_ct.OldValue and loai_ct = $loai_ct.OldValue and ma_px = $ma_px.OldValue">
  <!ENTITY k3 "@kind = $kind.OldValue and @ma_ct = $ma_ct.OldValue and @loai_ct = $loai_ct.OldValue and @ma_px = $ma_px.OldValue">
]>

<dir table="sfctnx" code="kind, ma_ct, loai_ct, ma_px" order="kind, ma_ct, loai_ct, ma_px" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin nhập xuất tự động từ phân xưởng" e="Auto Floor Stock Moving Declaration"></title>
  <fields>
    <field name="kind" isPrimaryKey="true" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Nhập, 2 - Xuất" e="1 - Receipt, 2 - Issue"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0L8XkVeVwyQ21YM+SQquZEo4IEuWiM1GaO9dCXywKtSyg</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="wedition &lt;&gt; '9' and ma_ct in ('SF1', 'SF7') and (('{$%c[kind]}' = '1') or ('{$%c[kind]}' = '2' and ma_ct = 'SF1')) and status = '1'" check="wedition &lt;&gt; '9' and ma_ct in ('SF1', 'SF7') and (('{$%c[kind]}' = '1') or ('{$%c[kind]}' = '2' and ma_ct = 'SF1'))" information="ma_ct$vdmct.ten_ct%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgreggcm45KT5Gpiv6+mSDrKrA1ivlGPAL2UHQK70Klrh</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" isPrimaryKey="true" allowNulls="false">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="VoucherType" reference="ten_loai%l" key="ma_ct = '{$%c[ma_ct]}' and status = '1'" check="ma_ct = '{$%c[ma_ct]}'" information="loai_ct$dmloaict.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" isPrimaryKey="true" allowNulls="false">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" allowNulls="false">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">

      <item value="120, 30, 70, 330"/>
      <item value="1110: [kind].Label, [kind], [kind].Description"/>
      <item value="1101: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="1101: [loai_ct].Label, [loai_ct], [ten_loai%l]"/>
      <item value="1101: [ma_px].Label, [ma_px], [ten_px%l]"/>

      <item value="1101: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>

      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu01WLviO41AwGyqxu+TVcDxo7ku357PY08f16UzT6I1K3SB10y/yuu1l22kStc7SUL8IVT3DBnzJ8tB+j83+tCuIzhvUVGDr7wPbdtTze/2MGBAFIehtdcGII1l7cn9x0n0EEeaL+GGBtji5RGblEZ6HOWqTVmbLHS2eAc7ZN51YETtmBlceHYe2cl4Om7Qb8qlMqJTFPoN1jWrL0dVW2DTNn8+lSOZJCvoOhSTdlLz0</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIS7RL16uXI+oYogfPjufjQzE6aESq7qrk5lGjz4LzAfivE0VmhBF/N3dUvTYwjjiB96bmuzGKBTcrHneqj8VoYRHN8hMfr+eBkQX0yQn8f4USGlnZtLx2phRn+DmtHt5UiZcSVu+Rsaa3xWXlsoLytz4CFfTq+ETEzCSeHdmmcSd35wGrCcA7MCrQOmbpaw5BfwPh7hfpfyorBXEgvsBzcg07kPgiS/HmaRkiGVDlCMguhcT+CMidZZRspWas7/Pnqb4NBfa+8uCH+YllC2XU8Q3m/deMnNXCwyLSwe8nw2+eMmGdcRiC+RvKjTAYAMAFuqeOyRYzOm/PX8Atkp4lPKi4zsGP6JzHlUptEpAsYMsChd4vh7Q96uagpLbWZMyr</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUNW8PgB94fZ4qbw/AW2+79g+P/lwbc0jGP4ioRmAmPwiUwukFFI/KeOLhPXaJiakGDLzryXVyHQ8L3Sc+4U9+fq7tdb7zvEakAwbOj/e3nz5gaUHXgpptlpLUVUwo+0awUQffEigU9vATwqrjy+3ivH</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUNW8PgB94fZ4qbw/AW2+79gNqgBGCOLCRisPFcxEycmbwkt6tISmZoiX0la5iBx4BkhPC/h6axy9Z1iBCUF0RVsLguojYVl5ASPq4c45kIB6g==</Encrypted>]]>&k3;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMA8lsc/rrzLjR+K9lBQchvxQqrHz60FHQDx0OSuS8ZRM=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6/TMrBiYLpBL+Cho2qg12wA=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyoB4AgwXbA5ZMCz9eDZk+PCAv2CzhRhEaaAt01wk79uSINApYQAjmo+dKiRwqv7vF21TVmbgNmr3lDe8PqBofDZ</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL497xg7bR27919eDFc9LQ2l</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&VjU3GNH23TIqLdiBR5z0LzS8oi9xgcGGjrsh3tJVRsGc2wdTF7HLApzaYMEtbmY6tfenwdGyGgPqJulbbyXB8SQHVcWyv8xFqdaVkYBPP4X6oCYhhJ7Xf7UJMXXFYQHT</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgqQ/lME6K4sO7Byengv1VCBxtosTPX6P/FdgeYMFIhqURcPBPbVIL0NJi8gjrYbFOI70UvjlxkEKWUe25R24mxjd2wmEI2VVYZSVjHEOM30W</Encrypted>]]>
    </text>
  </script>
</dir>