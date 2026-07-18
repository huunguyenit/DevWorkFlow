<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY MessageID "PurchaseRequisition">

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "02">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyPRTran @stt_rec, 'm91$$partition$current', 'd91$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>
<dir table="m91$000000" code="stt_rec" order="ngay_ct, so_ct" id="PR2" type="Voucher" xmlns="urn:schemas-fast-com:data-dir">
  <title v="duyệt, hủy chi tiết phiếu nhu cầu" e="PR Approval"></title>
  <partition table="c91$000000" prime="m91$" inquiry="i91$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dept_id" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người yêu cầu" e="Requisitioned by"></header>
    </field>
    <field name="ma_nk">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') > 0))" check="1=1" information="ma_nk$v20dmnk.ten_nk%l"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số phiếu yêu cầu" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày lập" e="Invoice Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" inactivate="true" dataFormatString="@datetimeFormat">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approve"/>
        </item>
        <item value="5">
          <text v="5. Đóng" e="5. Close"/>
        </item>
        <item value="3">
          <text v="3. Đặt hàng" e="3. Ordering"/>
        </item>
        <item value="4">
          <text v="4. Hoàn thành" e="4. Completed"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
      </items>
    </field>
    <field name="ma_md" readOnly="" allowNulls="false" clientDefault="Default" disabled="true">
      <header v="Mức độ" e="Priority"></header>
      <items style="AutoComplete" controller="Priority" reference="ten_md%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_md$dmmd.ten_md%l" row="1"/>
    </field>
    <field name="ten_md%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="d91" external="true" clientDefault="0" defaultValue="0" rows="257" categoryIndex="1" allowNulls="false">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PRApprovalDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="xs_name" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" readOnly="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="kieu_duyet" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="317" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0"/>
      <item value="110100000011011: [dept_id].Label, [dept_id], [ten_bp%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110--------1011: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [loai_ct]"/>
      <item value="1101000000-111-: [ma_gd].Label, [ma_gd], [ten_gd%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101000000-1101: [ma_md].Label, [ma_md], [ten_md%l], [status].Label, [status], [xs_name]"/>
      <item value="1100000000--11111: [dien_giai].Label, [dien_giai], [ma_dvcs], [cookie], [ngay_ct], [t_tien_nt], [kieu_duyet]"/>

      <item value="1: [d91]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wFWUp5cnw7/yI+eePfqRBNVut/Qq8vuqKGGUzWB77hPGvLTmcglrQH1AtZAvxd++95pGtGzv7X/dgq/R8aSZes=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu55scXOlxRccCj/IW2ddcSRtjrz8FSqt21CvvFMquD8/0YulOVqDey7rM2SU4LCa5kOHkmJ3e31xjXfUHWxbsqNnCGeX4uojt54IpFUXoDCf1vir8PIJF6/ux/T2xek/anSj1W1Hyz3CfhTRU7pu6XiSbwzvQsJ2dLXKqSHdLjlAr7BvAW3VJX+IYWPWuA23vObrgo1tnA17q4Sm89f+djtHBDzJrN0JiA2yWeZU15QDpGE8MQMJ4rmfqFxuAN6dLa9z8PRv5JL6fxXUm/pp8oStHeL2hiLv0/4shP+l2ZaDccioWlXN8LWg5JKju/8S1CYQYzmUlQEwOvUCYpoQtXjPEG2g/eSN1p29n+qo4iLuVwyqvy+3zYUusIsH46223aOU+wX95C/8yiantPnVl4UwHs1x4dimVfVLMA4Bky5xeiD06Uo13bRxSmhRN5x8WBLNV7CnwBPWn38+qarVWi36NjeyHw/3i7djkUDLdIemL50dV0YXqdtyLw49+wL9M0vwkgVMyzp4q+lobOPN0U8=</Encrypted>]]>&VoucherApproveLog;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YoXcPZBhLrNfmIPxHvMUvzZa7SdQ3Q9uN9N6iQbpsGvTtsHwzEwOPzEBdiKf1jA1Y8Tn1Fq7w24G1mFv5OcmUcR4n6mhZ+LgypoSd2mqUJ2peVG54nc7FM5NSZ0QGDuJ6l57eDMB5Pj7TOLTkTuW+VnsvtFZGDZ2qpMHYnYGMJ8R/qb/0AmLfYJ66SrcBVn2w==</Encrypted>]]>&VoucherApproveLog;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cX9fhjXvUHWQ+bH1YDxqZ8HvFp3w/2iO+FwGBujKardlUol6ohcwRYmXrhBIGgFI/+f/GO1aOWhIxIPVBvz/5bY/z5AgYQEpKIUbHWB7uRLXPlYbZQjeMJikkPsnRjd5hEd4CyOhU97HjdVdgDokff7zarHPvUcBcjIWtAvmTK8O8NeuFHLPj+CiGmLWAzmIdFotFLl3ZHAiPJbI0nI0Os8BY5iXVs6FUXjQDITWh3REuz/hkcbINynipAxT+b/ahzjlDJwQMvkzVAB4MyCqpQRBuzlD3we7QMEvG8Sdes+qg7QhyMwNSnas2N3RfDWH0K8dTvWs1xCMcWrpJev0m0Kg3e3rsMEaWGvpZwrl/wml8t4J28uaAXQJXf7i3aamNhL5daZwTQTPiOr8rkhQLHZ+7t9nGLmfE+jndylk2aB2EHYCoKU95dJVhi4aLqi2VWUjUIQSEguSsgp4kMfLcFbtsbtHYdogXzds/gGnn2jfXoB6/JHNzQlpYPjVjXehBkiPV7IdPXM5yYrj6XPPvXjT6TbK6mmYbTfdE5KIwY9/VWwwsyGP8f7jbljkuil3XnLn2PngZsNYvxBH8x3dkQmo+SqBU88OFfhGRmANBJpZp/tAlmquaRxZUZSMgklHp9vW1/IrquLK7u++W8risrWLPX70WaWcBGP6ulo6g6t3X79A8+kjN4oUxIxMgtioImc4JW8+udCJe0c6uUci3E5qEzr/tTlnSIAwAYOUKfLhsesqZvkZV9e6X7psytc87VrXKnZRHe8fo2VpRx4sz5q5pykj0YfPnockN2iybE0zr7BEqeTJI2x6VlUkyceGVt6ka53OS60+c21vHHFhgdYlKyiZduFgFUPfine9aaac5jGzNRxN9H9Nit2MBSy/D034dlLSTQzQDU8vrBhkbEc1GqCn2NMveCWonCobiUnfvN6tgiwyLo2vEsAzIMH7uI2Hjf0y7/NjInFPwpumJua9u/qkiq+m4ItbjvQ3ii5CaIy9gyrwdA3eNT4n7DOkQ==</Encrypted>]]>&MessageID;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5XtoUU4blKG9/ssgopM0GGGGsGkvUUiuNfiyjpIGOgrvrmxPZy+Zjl/jj9/Bwn1G3SNxRiduG8MVTxb2tmUqAUBCdgd+RRH+tecmMsj+M1XacdW3y5eZLVtGYKsmd2lavXIq3qkgbZTToqL64CmgGaNS3sYawMnvimSENzG92k770k2JCE/5u7oIJrwN5Q5C8A==</Encrypted>]]>&PostNotify;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Sy2qX6dpSRhyOaCNo0i2ikoMFl80CVtK+03ddX+4PdzoUAygJwdbrwkiEWK8/0i1knAR2wFqKXW+/hI9Yc2G4EEbYIhatDCDL6hQqzMRxhPJ0UHeLGqcy0FNy+DjjhVJN0PF6NFKMNwgSlrhNT5lLw=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4THHZ7t6shOSy8GIzj/Zo8Iyx6pLSrlMc5PP2emR2eYYHDI2kTzfm6h7cEimcYxgwXgPVJxRxTB/GDS9yB8Pb5x+9jsdfbRyvwpnpp8RHgZWjcGim9bEpEXN66lvvbvQHu09j65iDtmA6EL3XXpUN7GbRYP2wopXkChhbzuGvUjBZqIkuIYGyilMw5rKULCE0iyD/l8RSYy//pQ5ePChzlDE40OrO/ttMWL1VzyR8nEQWp9cxA6no4Y+lwsUA4IEYOSMKa5Aut3Uto/DYNmvWdT9wzmb+jCNVY6+HjLi5k+hY2aOAgMVgkm+6p6yGoNgo51nuwkLPeCKRMC0jPiiMzaJiDS9VxyIlw5qCmEQwJvqL0DQ8Ee91PAc8cCexR1uCRG6CqRd1qXmuw71/t+6Zvc4WlQUH9IFBblCeaMEKulL7dGA4ceSZUaprrbDMkurpzF0ojJZEcuKz6PBgozZCt7K31JddvP6Ru7RZW0oXKFJPlpgaguDHNeFRSsnEHqtzpwY0WgvDakECUsGzq19W4VXLL+6RB6DoXZgwGEx8k5uOKIIavVvxTWThq/BO7efsUz4j+rwDsH7G1pSZlKkR+o=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtR8ayzuxhhlirEkFQDI89iE2J3qIRhgra7vHmeXsd+a7XBLxHx0+Mbmjc79RbyQOSYAKuj9+Py7bQ9gUI7JLjMAcUvSjziSEimwTUSmz7dcVeNINAJFZwSUQfaJxF7evglTOlZ6RE2HlmJLuPlv2KEEGBMmzsuT2fr0zqrW6p1YOgJ1AppiIBh/wCNql3CbL1msGvWoi7TZ+GdJDJ87/LQFgcQzNbm5Xb9S9foouMT0/flF6i3JKN/qRw8JcKiu5v5o6SXAblfemJX1bhfV/NLKOQLGE0kqUjz3bBRcJ8v+C1JLxkbOL/fSum04HyGj7ba76XRDWorL9yEAIuJCHNXs=</Encrypted>]]>
    </text>
  </script>
</dir>