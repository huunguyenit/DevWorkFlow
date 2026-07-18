<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY % Config SYSTEM "..\Include\XML\Config\Fields\Config.ent">
  %Config;
]>

<dir table="dmct" code="ma_ct" order="ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo các màn hình nhập chứng từ" e="Voucher Information"></title>
  <fields>
    <field name="ma_ct" isPrimaryKey="true" disabled="true">
      <header v="Mã chứng từ" e="Code"></header>
    </field>
    <field name="ten_ct" allowNulls="false">
      <header v="Tên chứng từ" e="Description"></header>
    </field>
    <field name="ten_ct2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_ct_me" categoryIndex="1">
      <header v="Chứng từ mẹ" e="Parent Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct_me%l" key="wedition &lt;&gt; '9' and status = '1'" check="wedition &lt;&gt; '9'" information="ma_ct$dmct.ten_ct%l"/>
    </field>
    <field name="ten_ct_me%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" type="Decimal" dataFormatString="###########0" categoryIndex="1">
      <header v="Số hiện thời" e="Current Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="trung_so" type="Decimal" external="true" defaultValue="'0'" allowContain="true" categoryIndex="1">
      <header v="Kiểm tra trùng số" e="Check Duplication"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Không kiểm tra" e="0 - No"/>
        </item>
        <item value="1">
          <text v="1 - Theo ngày" e="1 - Daily"/>
        </item>
        <item value="2">
          <text v="2 - Theo tháng" e="2 - Monthly"/>
        </item>
        <item value="3">
          <text v="3 - Theo quý" e="3 - Quarterly"/>
        </item>
        <item value="4">
          <text v="4 - Theo năm" e="4 - Annually"/>
        </item>
        <item value="5">
          <text v="5 - Tất" e="5 - All"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LJfbyRlmlXEGZsUK3N6dETZUZxWKJlV2si+h0odvD8ntGyo5DuDDXxW2uQaJ8EzbQfj5hnMp+n5TiRT4D503w1dz26KifPeugnwwv/20+CszYHFLUSaKxlq1jbTE6yOgA==</Encrypted>]]></clientScript>
    </field>
    <field name="cb_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="1">
      <header v="Chỉ cảnh báo" e="Warning only"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" allowNulls="false" categoryIndex="1">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="m_ma_gd" categoryIndex="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = '{$%c[ma_ct]}'" information="ma_gd$dmmagd.ten_gd%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="m_loai_ct" categoryIndex="1">
      <header v="Loại chứng từ" e="Transaction Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = '{$%c[ma_ct]}'" information="loai_ct$dmloaict.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>
    <field name="m_status" categoryIndex="1">
      <header v="Xử lý" e="Action"></header>
      <items style="AutoComplete" controller="Action" reference="action_name%l" key="ma_ct = '{$%c[ma_ct]}' and status not in ('9', '*')" information="action_name$dmxlct.action_name%l"/>
    </field>
    <field name="action_name%l" readOnly="true" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="m_ong_ba" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Người giao dịch" e="Contact"></header>
      <footer v="1 - Có sử dụng, 0 - Không" e="1 - Use, 0 - None"></footer>
      <items style="Mask"/>
    </field>
    <field name="m_loc_nsd" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="1">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="tieu_de_ct" categoryIndex="2">
      <header v="Tiêu đề" e="Title"></header>
    </field>
    <field name="tieu_de_ct2" categoryIndex="2">
      <header v="Tiêu đề khác" e="Other Title"></header>
    </field>
    <field name="so_lien" type="Decimal" dataFormatString="##0" categoryIndex="2">
      <header v="Số liên" e="Number of Copies"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_ct_in" categoryIndex="2">
      <header v="Mã chứng từ" e="Voucher Code"></header>
    </field>
    <field name="stt_ct_nkc" type="Decimal" dataFormatString="##0" categoryIndex="2">
      <header v="Số thứ tự" e="Line Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="max_row" type="Decimal" dataFormatString="#0" align="right" categoryIndex="2">
      <header v="Số dòng" e="Rows Count"></header>
      <items style="Numeric"/>
    </field>

    <field name="post_vv" type="Boolean" disabled="true" categoryIndex="9">
      <header v="Vụ việc" e="Job"></header>
      <footer v="Tên trường" e="Field"/>
      <items style="Numeric"/>
    </field>
    <field name="post_sp" type="Boolean" categoryIndex="9">
      <header v="Sản phẩm" e="Product"></header>
      <footer v="Sử dụng" e="Use"/>
      <items style="Numeric"/>
    </field>
    <field name="post_bp" type="Boolean" categoryIndex="9">
      <header v="Bộ phận" e="Department"></header>
      <footer v="Nhóm khi lưu vào sổ cái" e="Group when Posting"/>
      <items style="Numeric"/>
    </field>
    <field name="post_lsx" type="Boolean" categoryIndex="9">
      <header v="Số lsx" e="MO Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="post_hd" type="Boolean" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="post_ku" type="Boolean" categoryIndex="9">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="post_phi" type="Boolean" categoryIndex="9">
      <header v="Phí" e="Expense"></header>
      <items style="Numeric"/>
    </field>

    <field name="use_ma_vv" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" disabled="true" categoryIndex="9">
      <header v="Vụ việc" e="Job"></header>
      <footer v="Tên trường" e="Field"/>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_sp" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Sản phẩm" e="Product"></header>
      <footer v="Sử dụng" e="Use"/>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_bp" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Bộ phận" e="Department"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_so_lsx" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Số lsx" e="MO Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_hd" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Hợp đồng" e="Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_ku" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="Numeric"/>
    </field>
    <field name="use_ma_phi" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true" categoryIndex="9">
      <header v="Phí" e="Expense"></header>
      <items style="Numeric"/>
    </field>

    <field name="gd_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ct_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="xl_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="voucher_yn" type="Boolean" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="xstt" hidden="true" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>

    &Config.Field;
  </fields>

  <views>
    <view id="Dir" height="232">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="111111: [ma_ct].Label, [ma_ct], [voucher_yn], [gd_yn], [ct_yn], [xl_yn]"/>
      <item value="11001: [ten_ct].Label, [ten_ct], [xstt]"/>
      <item value="1100: [ten_ct2].Label, [ten_ct2]"/>

      <item value="1101000: [ma_ct_me].Label, [ma_ct_me], [ten_ct_me%l]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
      <item value="1100-11: [trung_so].Label, [trung_so], [cb_yn], [cb_yn].Label"/>
      <item value="1101000: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="1101000: [m_ma_gd].Label, [m_ma_gd], [ten_gd%l]"/>
      <item value="1101000: [m_loai_ct].Label, [m_loai_ct], [ten_loai%l]"/>
      <item value="1101000: [m_status].Label, [m_status], [action_name%l]"/>
      <item value="1110000: [m_ong_ba].Label, [m_ong_ba], [m_ong_ba].Description"/>
      <item value="1110000: [m_loc_nsd].Label, [m_loc_nsd], [m_loc_nsd].Description"/>

      <item value="1100: [tieu_de_ct].Label, [tieu_de_ct]"/>
      <item value="1100: [tieu_de_ct2].Label, [tieu_de_ct2]"/>
      <item value="11: [ma_ct_in].Label, [ma_ct_in]"/>
      <item value="11: [so_lien].Label, [so_lien]"/>
      <item value="11: [stt_ct_nkc].Label, [stt_ct_nkc]"/>
      <item value="11: [max_row].Label, [max_row]"/>

      <item value="11010: [post_vv].Desciption, [post_sp].Desciption, [post_bp].Desciption"/>
      <item value="11-1: [post_vv].Label, [use_ma_vv], [post_vv]"/>
      <item value="11-1: [post_bp].Label, [use_ma_bp], [post_bp]"/>
      <item value="11-1: [post_lsx].Label, [use_so_lsx], [post_lsx]"/>
      <item value="11-1: [post_sp].Label, [use_ma_sp], [post_sp]"/>
      <item value="11-1: [post_hd].Label, [use_ma_hd], [post_hd]"/>
      <item value="11-1: [post_phi].Label, [use_ma_phi], [post_phi]"/>
      <item value="11-1: [post_ku].Label, [use_ma_ku], [post_ku]"/>


      <categories>
        <category index="1" columns="120, 30, 70, 100, 25, 25, 180, 0">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 100, 100, 230">
          <header v="In chứng từ" e="Print"/>
        </category>
        <category index="9" columns="120, 25, 75, 25, 305">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcINg9+f6l17wlRy7NKwfZ/jAmCzWH22isyrYpZJ49XVG</Encrypted>]]>&Config.Loading;<![CDATA[<Encrypted>&eBkiS2dx7NHLPGPbXWSsup6NvanKUnpqT3PaI6dHnRxNEFrfZAJ52yceRYeAWSKUVGUVCZFAS6JMQ3f4EZrtug==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPRbB5mzzhVQxydv75n/Vm2lFkhV8N+l2A90R772qeVMSMgAV4P8UcTJcYa1OLzXOpVM4v/BUPa2a293+KogQ1s=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &Config.InitExternalFields.Declare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2AbD9tykWXQUq5htxZWjprcf7sdgBKvbc1969LcQog43FVNkryajFNeseFHeXxGW7MxLR6M3nkLTaKCt1M0qJumRzfOr2GwFrhADBkCo0LNOn2QmVjH4H/0N1ZBoeC7hff2vydU4JOeNFdbhLznKz7/Eh2lRqC5QEsfVtxvBNZuZb0NHz2Azug6xN9/iBmObQYLXqTKFa4mLb7I4h5ZXVGsBRS6y/HxuzHjol5noQ3Ycaq1Jm9wgu7OJwd6/2EhB8lRXTUs42v/+agO2gHONVrwSmIptoEfn4NjJ2dk/JE1Vmw1g+fIcSaklZIgWKp5fAMxQtQw6qJ1RF+8E/iVuZx2qmwTzuFq+Zn2h5frkMONcPKvvNlA8urrNsqG9nAwCwoT+2LLeqTpBzNdl7CWuuePQgx7gSsYCdrcQtuKj0ah4vRUbkVtyPtd+8Qzf005lS7U+T0spXl8DMzt+F6eCisT4EEBc/1Qpv9oM3PwSlBX5vN8nZnwn31WTVWxyR6CTzEznwmeoGWaeDDdNfEKu9nbWHFrKaBpNT3L3b98pkMEb1cB2rja6nrWQR3e/g/+MPd+FtAsdih12fUwgEMF1iUq1ig8wHwOMNTymdrB4b5ha05hQphBfckawRVkJ4U1XTxnlki4TEcyokIsUwG7qHo=</Encrypted>]]>&Config.InitExternalFields.Select;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9mv0j/A4m55WQArEC5OV+zoRElIQ/XbQIcqskJwL2jXWl7OeLCzVipJQ/2Ie4S1/4mp0knHpALE1GoDnumkMNGBEEtIQ0ePd+v2yVoLUpqFrq8vuC3a2kWzeBWMXHvWq5perPlpDGB9jjmxi+bUYvOg+aU/R77sXMRy919DL1VaEcj/Pd213rZeZI/ylb8w0JFpEYjJszqxWKaJhjkz1FKo8dfn0tdRnFqukwAc6HD1gu6qQd2i5Qrg83zLrJV3OXiapfsk9BAkm478SMhdYB2rrOvelfIflvf2/G50SBAgV5oE/neKztAjCdV72+58BpLbxNnOFvQawddwlfwibl8Mti4CNSXvBvJvMjRhsAMt6yGrvQXaGCSY+hDJOWIvHeEQwEvgk1AWlBWd6QQpiPXSb+irrbmj8CjPa/U3KeE5MQpHKpvzL4IQqX4V8yG2viyh8UGzrMK/M6O3/F5eQe8TlUDCAQIe+1wQoTNTfcWuzXV7qCQN6L+JVKXj6/Ux2BAxWHv8aDgQKI8gZKq3ppf3yqDq+O9yE4qYPgINOWWyhP4yT/t2nC3j47WDyjsWmTFWLqKZxyd6Amz/aWrlnUmk9G32jqnKVwRQwVfWdpTrxQIBztzXvRcLKVQHN1omIi9x0FuoVhUfZGdfhalrDh5TP9SXE5SMEthtreZLEqqn5tBJgrQ0E7FnxmsjnCO/2nDw7Be5TnEZsQYc9bCbn6iqZlk04QhvXTs+pgrrgxP5P6YcAylVMQeSMjJLmZNc9gtbSc3kfGfUWYtWP3adWLA=</Encrypted>]]>&Config.Updating;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4XcF3/5Ok0ME650RTITn7CVNK2+TqhqZ3NEpNpaCmlDKYtcBZj02LjwS9RzWi/1FXJXMIOm144Y44tG+AbKDNFjuahsb6uIUM5BBt51JSEWo/5atwqmPjDHlR1RKbAADg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5zDcSOzBeaHJNloUE1+hqfR3XzNtASSk9PtpYM3UVz0vRpZ0P+3mgia5C7jMPFQPsr7wLnd8zjwltPTlU0zucx2EIwNx9XFRFnfM4FRmc2aztCT4mDe32cV0WghVHyL+A2Y4Qae/O/cFeSpd9flWsGF</Encrypted>]]>
        &Config.Updated;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22b7GQJJzx98Sb1A/cDPFUtXOG43JUIG7KOhEWccSaNxZWl85XahVM0VQtW/xzdEQeCfM1cJRWktD2jaM0zypzKGEhe9YOUMsyqCCYr4rqwgL1RJeIUhgz+Ok7tbCq/h2183h2zWqwq5/br8z307RDDWB/z32OVqfb9Cl60/2W3S6dRTBgRIPUiQWZpzKcu45eOXzB5e7BB9cy5P9a3E/ZDEvy5+fcRps3ia8qETQQNB1w8vo3uawXW3i7gjo82m/BWn6STmwX36cnodY5juJRV4ckbm4nQINergNbWh1Gbu4yTHOCHHoec4wDqNYLHakq7BN8iH93YkKt3M365PzVqig2vaV5PHpz0W7jBxmbEu+vWjTcqNR6Q7LhuXzPC3RHuMBHsSzzqL1RAbgwF7scQmlNbQPuu2CBisPCwpkTOPFVOf7v/RTAhtK1aaIsQzhaw/Vrj8l5LJSv0x6raYF2TDcullXG8DQXatos385q4Nw</Encrypted>]]>&Config.Tab;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b/e1pCAg+zyf/ATcVP1G9LeOXafzXEFkF3KQWt4hpi7DNTVK/yOpDKRzUtCJ52wLW5ta9hls5/9QUTZBLd5JSKDxDMv5PRSLxB2QG+y2m4oYME1YMN6UqEiwkS2NbiPVkLnh+imgOgbdLnDZmpYbG5ZM5XRcpBcjyJegv/zdm4OlBmKtvW3VDp+w3mxYpPmdBaQLYVdNWEQfdR4E69fHtVtRkF+WbK2p+wcpyINF74jeofFqbkBEAkDZ+gc2K6tqsTMymZ/zIbPF8pldWFeIza9qh+Mva9OcYryT2W4icN5m5vYnUKD4AOJ5eeRjCc0tHu7Jk8/zq0H8ot7b5VW970TsK/Dz5vHnojm7OJGM7pPsq3PUc1M6unZM33RDlbJknLC3JuGZ11ym/2joNqvTCiUDFJpZMIm++YFnl8mAPuSZsKuWtSAVd9QKGlOBeXDlU02nJC1Ry609Nnlet85zDcaBhTPGjmMLVqLYNhcpU6PIulQGofEu2RXKnY+6YuCu0660W0Hb7KLrWSLScMBHGE6yJXhov0lTskPBl+QUWkgZ5zytxXEllrdBQvMl+k5vubFcegHj6z7GoaGA1Chj8nE4XG9uTyUshZmb9VAvdJYfKrKHC1sMtlpCQ/MI+vqXhW46lCX3nN0tYWpKFSiywaYie2E7aZ3nnHY//2p4+7ekmG9/VpSm2HpeyUBa8rHuR4Vt6I/wjbM1jNdI42haMPBgTB81G0Rb6/BhGz3JmbS</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOy6WxgI9fu62fMwf84zS45sFkQeuQJS+QW+PQO9JIELCYvzFyZtYAsYSmK8Ty+baSOv6c2JwhPU2lPXPnHMBYMphGQ8C+HxYla+WRqmS9JLbtHXi4cPmLSvomhMAtvR1m7xthme863WWFDtHDGBZBMsqWdrvPBF9wIhIWwnNCcU</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>