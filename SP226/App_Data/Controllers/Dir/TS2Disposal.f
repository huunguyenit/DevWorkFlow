<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ToolSupplyTable "gpbdc">
  <!ENTITY ToolSupplyField "stt_rec">
  <!ENTITY ValueDate "@ngay_ct">
  <!ENTITY FieldDate "ngay_ct">
  <!ENTITY FieldFocus "ngay_ct">
  <!ENTITY ExternalKey "">

  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeEdit SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeEdit.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeDelete SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeDelete.txt">

  <!ENTITY CommandToolSupplyLockedBeforeEdit SYSTEM "..\Include\Command\ToolSupplyLockedBeforeEdit.txt">
  <!ENTITY CommandToolSupplyLockedBeforeDelete SYSTEM "..\Include\Command\ToolSupplyLockedBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ToolSupplyLockedDate.txt">

  <!ENTITY CheckData "
exec rs_CheckTSDereaseQty @ngay_ct, @ma_dc, @ma_bp_dc, @so_luong, @stt_rec, @$xvalue output
if @$xvalue = 1 begin
  select 'so_luong' as field, @$invalidQuantity as message
  return
end
">
  <!ENTITY Post "exec rs_PostTSDecrease @stt_rec">
]>

<dir table="gpbdc" id="CC5" type="Voucher" code="stt_rec" order="ngay_ct, so_ct, ma_dc, stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo giảm/hỏng" e="Tool &amp; Supply Disposal"></title>
  <partition table="gpbdc" prime="gpbdc" inquiry="gpbdc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" allowNulls="false" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_dc" allowNulls="false">
      <header v="Công cụ dụng cụ" e="Tool &amp; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) or @@admin = 1)" information="ma_dc$dmccdc.ten_dc%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ld_giam" allowNulls="false">
      <header v="Lý do giảm" e="Reason"></header>
      <items style="AutoComplete" controller="TSAcquisition" reference="ten_ld%l" key="loai_tg_ts = 2 and status = '1'" check="1 = 1" information="ma_tg_ts$dmtgcc.ten_tg_ts%l"/>
    </field>
    <field name="ten_ld%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp_dc" allowNulls="false">
      <header v="Bộ phận sử dụng" e="Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="(exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from ctpsdc b where b.ma_bp_dc = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')) and status = '1'" check="exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from ctpsdc b where b.ma_bp_dc = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')" information="ma_bp$dmbpcc.ten_bp%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" disabled="true">
      <header v="Mã tiền tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="kieu_pb" type="Byte" dataFormatString="1, 2" clientDefault="1" defaultValue="1" align="right">
      <header v="Kiểu phân bổ" e="Type"></header>
      <footer v="1 - Theo giá trị phân bổ kỳ, 2 - Theo giá trị còn lại" e="1 - By Allocation per Period, 2 - By Remaining Value"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" allowNulls="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>
    <field name="sua_gt_pb" type="Byte" dataFormatString="1, 0" clientDefault="0" defaultValue="0" align="right">
      <header v="Sửa giá trị phân bổ" e="Edit Current Value"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DxomfUy1O0z/5I3DBzBd4XMPNLhhhB5qfAJGra7L/im</Encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" disabled="true">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb_nt" width="100" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Giá trị phân bổ nt" e="FC Allocated Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" disabled="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb" width="100" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Giá trị phân bổ" e="Allocated Value"></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia_nt1" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb_nt1" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia1" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb1" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia_nt0" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb_nt0" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="nguyen_gia0" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="gt_pb0" external="true" hidden="true" type="Decimal" defaultValue="0" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="ma_dvcs" allowNulls="false" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 110, 120, 100, 0, 0"/>
      <item value="110: [ngay_ct].Label, [ngay_ct]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
      <item value="1101001: [ma_dc].Label, [ma_dc], [ten_dc%l], [ma_dvcs]"/>
      <item value="110100: [ma_ld_giam].Label, [ma_ld_giam], [ten_ld%l]"/>
      <item value="1101001: [ma_bp_dc].Label, [ma_bp_dc], [ten_bp%l], [stt_rec]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="111000: [kieu_pb].Label, [kieu_pb], [kieu_pb].Description"/>
      <item value="110---11: [so_luong].Label, [so_luong], [nguyen_gia_nt0], [nguyen_gia0]"/>
      <item value="11100-11: [sua_gt_pb].Label, [sua_gt_pb], [sua_gt_pb].Description, [gt_pb_nt0], [gt_pb0]"/>
      <item value="110-1111: [nguyen_gia_nt].Label, [nguyen_gia_nt], [nguyen_gia].Label, [nguyen_gia], [nguyen_gia_nt1], [nguyen_gia1]"/>
      <item value="110-1111: [gt_pb_nt].Label, [gt_pb_nt], [gt_pb].Label, [gt_pb], [gt_pb_nt1], [gt_pb1]"/>
      <item value="1100001: [dien_giai].Label, [dien_giai], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmyadYx23l9wzKANOt69qshVLC3NQ5GpacEPhSFL8FNHoXZRdZYYxqf79Mzpo7G3h8+z9BTbnW1/QKlgvdyOWObn/6xSYl0oGBYsloQF0RohrZdOWW/I/9WLVb/7F54EYu0ODR3kzmBJvlZRKO3EgDzCRZ5L0ML/jhMRXdNMqZFCWq5bc+5iiCzMsE+Bo7Btcr0Fq5QPxrBxO225Un+y9oy</Encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmyadYx23l9wzKANOt69qshVLC3NQ5GpacEPhSFL8FNHoXZRdZYYxqf79Mzpo7G3h8+z9BTbnW1/QKlgvdyOWObn/6xSYl0oGBYsloQF0RohrZdOWW/I/9WLVb/7F54EYu0ODR3kzmBJvlZRKO3EgDz3c6GsoA3wUeZGqp4hkohXjZAEpauodSu+eLe/yMalMU=</Encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcExrb1rgt2g6ZzuTDqa2PcA1JFZWb/vMEKNcvMPO23X5+A0Jj3OYnuuCx3f79J5zB8JwBM+q1+MsPh1FkkTEwpI=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu63TusraEmhjHnSeBBGWjOHhcBE8nTVmenoBbr+2P4KbeNUfL5nw7L5ITUQHPpVzQAzDsnWgmC0dQ+soHXg6Nerzoy5rnzzqFQop3h6pAAZOVCNpbG311CRx/8wRIct0HYagPxP4GV5bPDPel1Ov8jRDuZo8LkoFEVk/0hvVbaweIgHAI1q4nkfHcRJzi49w8Uqw4QnKT1PoMCdWQDQSqFxvlFfA8sHHJJEki0bHs3FiIXNWaljRUxCLma0WJRbAdihLRSXuLrkJUzjB4aQQ1xgwMEQcoT+GcLHOp+grxSKkDYn0Rg3HEGONi4uckO+EtpMTP9V0NPjq9w4zTae5JAhutPJf9ahmJw2lSmjHsGgLw1YUiOm6CGRMjnIxrzJ6NM1wmAWlnQE8QkIN/LZVinyYQeo5muhhlgy5bpwphSTdVUN4w9UjUyaPQXHXCYWYGEEYfY1IZw3/fsUvbajuAENt2SpNbGUuCGnwj++qHAoY</Encrypted>]]>&ToolSupplyTable;<![CDATA[<Encrypted>&DgGUj9YGpQp/CxUXxce/5Lbw3rS7CwGEhnysgOVe1zi+NqZzlhKL3Zs3aPX5j81pxSG4h6ONAt6sLHBveDc9GynQng1RX7uQaVRnJdM2VnU=</Encrypted>]]>&ToolSupplyField;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHoedZX9rn1RG0tLA4j9EYjM=</Encrypted>]]>&ToolSupplyField;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1kGTYd3UBzIhd8UIUlwl24JysaMOf9V9bT3vjgrD7SYoAlOxASYsxYZjHBg85gNG1eDU08grMMvFImYeBZhsqJTzclX2UsWsFdQm8Wy9K+COyQPNv/w8Jv0D8Sc9/GuQAd7CNdZOygq6/Pma8BSf1eNit0xuwM/jHf0g4iN80PzAefRDbGxAsQNGxwO7BTy1PBZv3dvxflm0yz2y+aa8EZKY7ebYKM6U7e8aoq0RRW1etyLTLYs7le5+H4fyl26gbX5iAs1fLOg0JRDCGEwb9wue9Su2bG9XyUXNB/NeXItTMYr3YmuVZdW2TF7+uTrSZY30ciGixy0wNH36Y4fFKhDb9M+Grp89A/7vV8fZMVIgLlL8M/cll7F2Dqn+6xoxt0HWWWg8If6WPWrwjeQz29A==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKeQTrejyfMsWhyx/15RRPNM+dVgNSAuEazJRKp2/b4ozW5VNft/OoO5PRHT8L4c5knlsrb0YF6tycHXKeyp9a5pRZewv1kC52grdeSblS08WiSzuVK37+hAe9ifg03NP7paxTmt3yIKJPAHw5PGBXDF6m8BkDa/ZuREKuiM2Kjx4A1c+cVPaZ/HwEkjc5RvtYTfMHNZXu8BatoBkinWb4Q=</Encrypted>]]>
        &CommandCheckLockedDate;
        &CheckData;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHMbfxGR/Opo76rCRmYWK9j8s8lSDvRpaEmSn4kWGDrUFkmFaUmor+9CJBOzJSZ+hc6ueHWz90JrCFg5mLd4F/IpELgquj/ad7EgHXBXaP4HqeiG0EJhMwtRqFdyMOe/uvjbYq3MDFlOovUFM+phTcyC47zMrto8jsIyn7VuHzlu</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &Post;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIqJooHwZPI80Wmvmq/1Zncywir/jO1KZHjku3hLM1jviUCbwc+kldqJPsUG9C0t/w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        &CheckData;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvztenCZleV0bMP46d7oY0AvkM4Z614pI6vN6BYn41SrzD/hxup3zDpHcCSP2VosnZ7bMTuB5+ZTJGzxfRK0J5mvRC/x3E3zMSzPkZ/X+aXuSPevz91dA01vKgsvF5DqWhpxhX0KIk8LbpiEy5zjHRbQHI2AXnYkn71sN1mv9ZyGOjh4M17cQVPuvGrPvOCThy6xE</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5J7zoS4VJz50Ttk7nHgZbhjpAzGmvmgakI0+Dh0kgRcyO3M8YVWDNjR9S2+wTJDbA==</Encrypted>]]>
        &Post;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1Pp8owFthqpameVVabqifFDaGf00LiqSq4p9FDIjCYTIrEEKmX75UntX8jH/EYtZJUwo9sCQBXtoTvMEA3/zcfZVMVTcPdNRYYqvlxDVYNE</Encrypted>]]>
        &CommandToolSupplyLockedBeforeDelete;
        &CommandWhenToolSupplyExternalBeforeDelete;
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9hHknFvc9lwNpCMXWCsR+4Xo8WyUsKdvkR8smBFbFezW5dez+qtZhpngcq0ATq3AA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EfeqZyqKyelO2cKTL1rTNaYVvQn391kCQPnIFg9XbbL3jfEscOp3R3ap60sbJWKJmvoKHTXFphu5s/ISrDzTMlWhqSqIPVCIl3DGwsPj13YJZwcjhytqW8VHTB2XsSgy3mTanssP8Jwi4HDrt+49KosPLawvXMRF52J9yemb8x2HEpe8YMXCXoa1skj/RwovX2JKwhMgo6XCbio5PhsoIqbRjW8ufHhbCyBMj1bZcaIH6QklxKrwiOH758VFj3TFhyCgdoIfSn6krwHZ6EiFFo03Gdo6EkObIboyKMnG5Y6D</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfkxPTktVnJLsi3oFdRB4jV7G+qR6fxBztldVXtpuztwHICduQe3x0TnALm4BQRg+sXHoYb5DnnXOa6ZEd0ndWDYiil9p2jFV5seWhRCACPEOE9Cnr50mqFMue0LTWvOuMSRcRwQLpz/GQX7K+QRb3c2gcbsoLKJo3gkwHy0N6cIoybNrSOJgb6jatoIymYKFuyywSjR8aJXipw+m2BJzFOFaixLcoFQJQtnzgqatIaQfpFQUFRYd0rA0biaPOQ5ahXIL1OrHx96fPew5bAtFIHhDSIxQNW5h+YGTA6JXRJIDouEEqQwPEBr/Ka1InsGHA14gTVG3bOo1pVKp2BCgXoFD0ZWq6uop2thugJtEHnfPwBQsrx0wvz8z0k6lxeFCd1RTXTf0oMEa2LAgSTb4R4MbThhu+tn6nX/vLI4h/1rSMTHPi/rYlpfBwokOZqXb+WLGkCyYDUXJb+O1C6XKWgRKVkw9Mp9e7cql+iy72eT3NT9vjJRWEcUDPZj73VD61Tw2knKcrufC44Id58H1ycS3tVSWDs+A/nbswsusYsnhhf5UcStRt7R5hXKZQyhH8JD2js33cRZPPO1t/v1qL+Umg/lgukla1BdmjtQm2/pIXjDiZMQJk4lPrvmrRt88sxWb6YQNRcfI8GzaXDd4sqp6SB+W5LGYAmp3TeFC8IkbhadxR/atXG/8y9HEmppVaraswk1wAsZt8hIGLcjM6R+MptEnJsk/lK8S2md1BQUh8G1f8pV6N2wdLtvVr5n8se6TLgx5AlufLT7Qbd6pP/sKlX7WElY3kKUWpFbTGCfZVTOdncP++sOBi5UVN6FfUn5lD0KqD5+56mFOnO6Vx1Pr4Kt9uzV8IkV7N4yXu4u8gprWFRyXJ7BN9ZDNC7jVLKpzjQTq/Ok/pZ6gj14K4wF6mctaSnXot/EB8Xkq6STnHDEDrTUkLVcbGfEj17asgAp4DLDBV0X06Sv/lAkP7W47gpY/GGI+ny+Nj3cPTqYBrtM7ac4NpFs+VHDTXlF73cqOVf51IM4TBHGKpR/3sSoVG28uxpD46oQZTlkEYpRHthWjRXI+zc6IolSm3YxL7F8ap/3XpIdnf+vpeQPbws7u8lZROad1uWznNGtkYQlZtH1HJWTav1aOKTfeebJlMBaizPsh29T+iAZnqcQcjwG5OMT9v+Zj1zNR1o5Y4c5U5pTWBNaHSHM3OSS+KPi/U5IVfsg1uhuuzC+CUrPA0QhVIvB2gGdsYSXMMHz2McDlRWHpY5XVyaI9bCnU/AyVRtUmg0xAl6shk9SUMoQMulVtBPaqyPYoDM7uONeJfd04sJajaB1zspAe0tGe+p71NBv5dT/Q6QCLhxn5KDxAd1UpZcdKLskweC3Og5TjD5qMzgBalY2w3Yyxfq2YMaL1oXH774Fduk6rx9PZBbgX8mwkXbciCw6voenV9vpfWhP85NPbj02C3/33KrgV5+5Erz2zUODelhOF6Qo1qDE7Y5QB2bwqAVZkeEWDak/mxD0xa9A1E7ck2DiL8JB0Us1iTyL74tJ8sHi1q88Ak9sCBDRx5ZpsXGXaHNbQ9RWXu48qN6g5ouB8DPuGSn69w2vAw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="TSCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5Y54LgDuE8BHQWgB7s8mZA+YHBqKMxHBQZ1+pfs6czk9epiCmZj91aFQmiRoAYWjrbikbpVtqbKkuxgvHZfXuz9pjL477vr2b936mPnHb+4iZhVSbkAnJc8Zuwwodh6hKrH9JP+hjPrZoeDTh03EKK</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>