<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" aliasName="defaultGLAccount" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L+SE36AQlsBvkp1lA5b3VVK9/x8zNY+dtVNWEGZoMP1609KwK7Gkc2/AHXbh0aSDA==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="date_from" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="date_to" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="nv_bh" categoryIndex="1">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="sx_theo" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sắp xếp theo" e="Order by"/>
      <footer v="0 - Mã nhân viên bán hàng, 1 - Tên nhân viên bán hàng" e="0 - Sales Employee ID, 1 - Sales Employee Name"></footer>
      <items style="Mask"></items>
    </field>
    <field name="nh_theo" dataFormatString="0, 1, 2" clientDefault="0" align="right" filterSource="Vacant">
      <header v="Nhóm theo" e="Group by"/>
      <footer v="1 - Nhân viên bán hàng, 2 - Khách hàng, 0 - Không" e="1 - Sales Employee, 2 - Customer, 0 - None"></footer>
      <items style="Mask"></items>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186">
      <item value="120, 20, 80, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [nv_bh].Label, [nv_bh], [ten_nv%l]"/>
      <item value="111000: [sx_theo].Label, [sx_theo], [sx_theo].Description"/>
      <item value="111000: [nh_theo].Label, [nh_theo], [nh_theo].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUnZHKfrqKh/xaDaZDqiQ2+euORcH55Tc27qSl4S3nUaw/WZeuDH14/+gl0RCdG5rn+Apgexel0Fy8eFfLTLCNhmKB3xd0nE+vAwoRJU+mqdg+gC3+VhAV/1B9ynZImz8Yg/8sdl0c0Fcd6pvt1/YZqVL7e6cmAwDLtBcIlPK+feOqyim1yXnZczazvWg5dnKgn1VbZrchP9mTAF2H7+4gSmkb2mOD5xlu83CUfgvhwmw9+tH+suDOsfQ2np2anNy01rTV2eWwh4a4/YiyP3S++wRtAf6Dk3+WF/7/yFUFjF9t9kGVAw+UjVIB717GNHnMlYxOSHsZz+J3ATPUM/7nR9rd83HVaeNguHpQOFduTXbRt5WiGD4GdZG5cr/AlyRFN</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9y7yL4YHdcmt6/SxnP/f71dj58jogy5vDGjLZU4oeDU5buNs0ZdijpPyfy3YhPrBDVpavA2cj1iT/6Sd5fYmsB+VQx4GXmB2rTgjeuWwxoSI0oaMib+Q0j2ixFlXsmiwD+qxQplh+6Guu0uiA2Ujd95PLoiaz8593OcC676t80siQQhHQi7VqincqPFLURSqVJeUD97e85s0MZvQHIqPhR0bCNXgUxxyls2Mh5+BUcpRdHFr/DZXYitgGaXqi4Ovu9qDJrHtV0UqzWA6eZiw1GMDcFDnjH4xwb1/Xyux5TXYiLvwTtFkHMnWVODD39Tpt35M/Xylz425zAikyk/6teDg+G/AukuriLLTQP035IGO52iPrI7lrjzJGwWI7bCAJ13tRssNpZGuaPlkwP7b/IJMdihfcKr4rw/NGwsufQv4utLdHrlrXWdPqIJ9t4oxGZRz4IZ/yo+EBqoLUBl64SvtqYG9UI4kVBx4CCUZuDj0jjUVubSCi1CRJyQPCKKPwROMOXD7z2T05sNYi04zHWXbQ+Ef44fFxl89MmS3qgVp1HdekDyjBqRw7j621jR3xmLZUgt71byO5ghNCBbY22l4qcFUeUS7Qw3uGOaUc/GE/dIduYxT5dvVBzv1rNi1gKpI3OHo29H9GA1C9u/uPvIBKVu22dwWHZhnN28Qz1+IMpvTBrnxQa05uieR2AY6BQbfwjV6QhJRtF1EEVMneRP99SEGPE+c1KoDDPFEZjobE9yvGRqgS0RBuFJCrOgtwTZHtego33txk3oZggiQaAOr5y2x1Sy+bgOBShDDKaw3Z4uggsW1K3yITUAS639v4mLk2/UFwFwsgvUTauEor6UwjmzE4FkfPV7iZy7Avo0G4iGFdLeTzkCcCWtGMExMqK+v1ljUuxb8xozKvOAwmf8mOrZibsaXe5mCJrDWk7fzTSWhwMBScLZPPfSwn06LtHZDDJHrXOCqH2B4G3FKU5OMJpiVn5TvftThDQE8cyholJdoJNMIkpqO0s7z7ppNevv82zBeG8OhuAES+lWo/n6mXhsiysFl3Xt59IzDJ8qSo07fVlTNKi9UvswWhCxwTQ+O2gYnvfdNvrlCuyCrr9ScHmDsOQ21lg28jIs4WT8YG9KechjYRxwLEcnjWVbn0UXhJBtrNoClsIzhcdODzBbI+qB1EemUfuIiokdTDSi2gip3dUd+KvN5GCta2zAUKCGwQ0IUvGGjt0Jn4B6Sexfhkqj1SR0+PElBkQsd6JjvrmDKvcDFzClL8zXtuXsTbWMnMETDU8K4CGe5SmbkcI3q+GzjLHNiYLUf9EL1isU46j/X1TYjm/HJSzQkusoIoo=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
    <action id="GetCheckAccount">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WD8ilRBR4KjYo1DaYuEP26aiKRkDdlXzv1P06TIUZVE1NNWVj3Xvn2XrQPZkpSEZafhYJY1yOsxQZy8b0J+gBWHquD6b0popwBnv/ji474som5tWGEHXVr+5o5S126StmB5y4JfodsCKolKstUvMSQ=</Encrypted>]]>
      </text>
    </action>
  </response>
  &OutlineCss;
</dir>