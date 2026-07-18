<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tu_ky" dataFormatString="#0" type="Decimal" allowNulls="false">
      <header v="Từ kỳ" e="Form Period"/>
      <footer v="Từ kỳ/năm" e="Period/Year from"/>
      <items style="Numeric"/>
    </field>
    <field name="tu_nam" dataFormatString="###0" type="Decimal" allowNulls="false">
      <header v="Từ năm" e="Year from"/>
      <items style="Numeric"/>
    </field>
    <field name="den_ky" dataFormatString="#0" type="Decimal" allowNulls="false">
      <header v="Đến kỳ" e="To Period"/>
      <footer v="Đến kỳ/năm" e="Period/Year to"/>
      <items style="Numeric"/>
    </field>
    <field name="den_nam" dataFormatString="###0" type="Decimal" allowNulls="false">
      <header v="Đến năm" e="To Year"/>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="161">
      <item value="120, 30, 40, 30, 100, 230"/>
      <item value="111: [tu_ky].Discription, [tu_ky], [tu_nam]"/>
      <item value="111: [den_ky].Discription, [den_ky], [den_nam]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6aT45fUUYtbmQe33CA/J/ZJbkJfh0qEzc7pyec535z51r7meoXzJFbFMTn8kbOPIafhmo8nXJsiMbXB39mihEgYJOX9oOoNljQJbPosKbRwVJzKO2DWhWd5yghiHNjkuEEM20e0irKQfUfIuPtPsKG5GT4vbPGREEAQsmcy70eM4MaaWTYsmycIWmrATQc1ceq+2s+YN79+L9isjO/ZzTFU=</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Km0dPcpP3WEHPRCYQOYrarGNaCXKQZqBqooA/e60XTUuwEQIEqm2WIbnNX3xF5UHciQ3EsYxqhtldJgDptmo7490oa3dUAbNSm149eCLgKfQi+DKK++1BQycuICT3HovDXOgZFOtCIbRpDFXmFVwdGc=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYlBO1TchDX3wJQH+G8C8hk++lkbqnqXxb6eeqC1/k1a7N5rsDRZKXEWxPBXCsg1VCSJ9PmhfrSF5Dvk1fRRXRYUlmS8x+HqJaVbuLIexZc+JoddSVlNAzC5mDM2grHQ/0b65rUtBnjQPGz9UZUAMzUCaXuCqlf3kbpgC/cnZ4CKyPu2DUmcaoPwBQYZ/SbMfRj7SJaIqu6XR2kCNc6dDVYc9SJYLrRwkul1hpgbUfBfhapKHPPH0CilU+PGyOkNfIbsKzIDsU/nkDWLf+DTVQDZxgCzEIT18U8A4NPNLsxQa2yoMJClsukGMJXfc4J0WVwIlaOMoDFP24/z7mG5igWjseTQcZGDByFo5oTxhffKSdXzyZCePY6RC5hJiekYWCEsHASBpVnEA75lzFuh1y1fcs7VAeBovaX5DmDchGkoL1zEGAc2V9I/Zy+bss6SfEC8X1++h9qJTpx6LroKlxGMofIA7y3kT5MhWudntn3g+ECODspVQ/NITndfw18WuJhFhejHTs3Yab6GrBT2LAqvc5NVT5kXxOodbNpgfqx+hGBDOf5okbWiJztAZYlyEj8u0oIwgubB8cMeho7PkrstfF88qGKekXSTfxlLCkdWKQFkEhkoin79Qv3KiqOW7fEFUMOHDuHOfIPj8BPTrklptrPDjEXMyuIoIWBLfmIAAM9Rq88+KzexF4sK5hbdvt/mjSZv95NnSqeTw/IclEOlMRmQx6UKSiphDz1CBUlHghzrznMKu915E6wKlWBoVEvYER2ZgxAHeUgWE+1tvKdOkIR2okGneBvCEjTXdVD847rkw+Vc2jdrMoxX4G9kdxWVuo4T5D0XhRA0KXVDDbjHzhPeJ/F0h5WK+iyVvAhUOZaXwTs0GQJQm6ituq0BvBKFHORUlk0mPMyUW7kZ8zqMRQ1SLsiZGPSvsTJMfQIHe86NQ7/c5a6mFvqUdweU7NIycCgAbyzAbUluS1w4ClKKPKU7hOqrpsNXtbNcC186ApTzR9jFVpMv80tf1Ik86VWJfPc4EgzhQ73yzJUclInQ==</encrypted>]]>
    </text>
  </script>
</dir>